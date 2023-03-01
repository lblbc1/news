package cn.lblbc.news.module.home

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import cn.lblbc.news.R
import cn.lblbc.news.module.web.WebViewActivity
import cn.lblbc.news.network.NetworkRepository
import cn.lblbc.news.network.NewsInfo
import cn.lblbc.news.utils.EXTRA_KEY_URL
import cn.lblbc.lib.utils.launch
import cn.lblbc.lib.utils.loadImage
import cn.lblbc.lib.view.LblRecyclerView
import kotlinx.android.synthetic.main.item_news.view.*


/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class NewsListFragment(private var tabId: String) : Fragment() {
    private lateinit var lblRecyclerView: LblRecyclerView<NewsInfo>
    private var downloadTaskId: Long? = null
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.fragment_app_list, container, false)
        initViews(view)
        return view
    }

    private fun initViews(view: View) {
        lblRecyclerView = view.findViewById(R.id.lblRecyclerView)
        lblRecyclerView.setLayoutResId { R.layout.item_news }
        lblRecyclerView.setOnBind { itemView, data ->
            itemView.titleTv.text = data.title
            itemView.authorTv.text = data.author
            itemView.commentCountTv.text = data.commentCount.toString() + "评论"
            loadImage(itemView.appIv, data.imgUrl)
        }

        lblRecyclerView.setOnItemClick { onItemClick(it) }
    }

    private fun onItemClick(it: NewsInfo) {
        val intent = Intent(context, WebViewActivity::class.java)
        intent.putExtra(EXTRA_KEY_URL, it.link)
        startActivity(intent)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        queryData()
    }

    private fun queryData() {
        launch(
            action = { NetworkRepository.apiService.queryByCategory(tabId) },
            onSuccess = { it?.data?.let { data -> processResponse(data) } }
        )
    }

    private fun processResponse(data: List<NewsInfo>) {
        lblRecyclerView.setData(data)
    }

    companion object {
        fun newInstance(tabId: String): Fragment {
            return NewsListFragment(tabId)
        }
    }
}