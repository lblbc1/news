 <!--
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 -->
<template>
  <div>
    <van-nav-bar left-text="返回" left-arrow @click-left="onClickLeft">
      <template #right>
        <van-search
          v-model="keyword"
          placeholder="请输入搜索关键词"
          @search="searchNews"
        />
      </template>
    </van-nav-bar>

    <div>
      <van-list finished-text="到底啦">
        <div
          class="row"
          v-for="(item, index) in dataList"
          :key="index"
          @click="gotoDetail(item.link)"
        >
          <div class="col">
            <div class="news-title">{{ item.title }}</div>
            <div class="news-comment">
              {{ item.author }} {{ item.commentCount }}评论
            </div>
          </div>
          <van-image class="img" :src="item.imgUrl" />
        </div>
      </van-list>
    </div>
  </div>
</template>

<script lang="ts">
import { search } from '../common/api'
export default {
  data() {
    return {
      dataList: [],
      keyword: ''
    }
  },
  methods: {
    onClickLeft() {
      history.back()
    },
    _bindinput(e) {
      this.keyword = e.detail.value
    },
    searchNews() {
      search(this.keyword).then((resp) => {
        this.dataList = resp.data
      })
    },
    gotoDetail(url) {
      location.href = url;
    },
  }
}
</script>

<style scoped>
.row {
  display: flex;
  margin-left: 10px;
  margin-right: 10px;
  margin-top: 20px;
}
.col {
  font-size: 15px;
  flex: 1;
}
.news-title {
  color: #333333;
}
.news-comment {
  color: #666666;
}
.img {
  margin-left: 5px;
  width: 100px;
  height: 60px;
}
</style>