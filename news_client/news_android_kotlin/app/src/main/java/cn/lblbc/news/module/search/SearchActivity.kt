package cn.lblbc.news.module.search

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import cn.lblbc.news.R
import cn.lblbc.news.module.web.WebViewActivity
import cn.lblbc.news.network.NetworkRepository
import cn.lblbc.news.network.NewsInfo
import cn.lblbc.news.utils.EXTRA_KEY_URL
import cn.lblbc.lib.utils.hideSoftKeyboard
import cn.lblbc.lib.utils.launch
import cn.lblbc.lib.utils.loadImage
import cn.lblbc.lib.utils.onSearchKeyDown
import cn.lblbc.lib.view.LblRecyclerView
import kotlinx.android.synthetic.main.item_news.view.*
import kotlinx.android.synthetic.main.part_search_top.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class SearchActivity : AppCompatActivity() {
    private lateinit var lblRecyclerView: LblRecyclerView<NewsInfo>
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_search)
        initViews()
        initListeners()
    }

    private fun initViews() {
        lblRecyclerView = findViewById(R.id.lblRecyclerView)
        lblRecyclerView.setLayoutResId { R.layout.item_news }
        lblRecyclerView.setOnBind { itemView, data ->
            itemView.titleTv.text = data.title
            itemView.authorTv.text = data.author
            itemView.commentCountTv.text = data.commentCount.toString() + "评论"
            loadImage(this, itemView.appIv, data.imgUrl)
        }
        lblRecyclerView.setOnItemClick { onItemClick(it) }
    }

    private fun initListeners() {
        backIv.setOnClickListener { finish() }
        searchEt.onSearchKeyDown { search() }
        searchTv.setOnClickListener { search() }
    }

    private fun search() {
        hideSoftKeyboard(this)
        val keyword = searchEt.text.toString()

        launch(action = { NetworkRepository.apiService.search(keyword) }, onSuccess = { it?.data?.let { data -> processResponse(data) } })
    }

    private fun processResponse(data: List<NewsInfo>) {
        lblRecyclerView.setData(data)
    }

    private fun onItemClick(newsInfo: NewsInfo) {
        val intent = Intent(this, WebViewActivity::class.java)
        intent.putExtra(EXTRA_KEY_URL, newsInfo.link)
        startActivity(intent)
    }
}
