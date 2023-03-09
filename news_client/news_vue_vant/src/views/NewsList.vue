 <!--
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 -->
 <template>
  <div>
    <div class="header-search">
      <span class="title-text">X新闻</span>
      <div class="search_row" @click="gotoSearch">
        <van-icon name="search" color="#89939d" />
        <div class="search-text">点击搜索</div>
      </div>
    </div>
    <van-tabs v-model:active="current" @click-tab="tabSelect">
      <van-tab
        v-for="(item, index) in categories"
        :key="index"
        :title="item.name"
      />
    </van-tabs>

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
import { queryCategories, queryNewsByCategory } from "../common/api";
export default {
  data() {
    return {
      categories: [],
      dataList: [],
      current: 0,
    };
  },
  mounted() {
    this.queryCategories();
  },
  methods: {
    tabSelect: function () {
      this.queryNewsByCategory();
    },
    queryCategories() {
      queryCategories().then((resp) => {
        this.categories = resp.data;
        this.queryNewsByCategory();
      });
    },
    queryNewsByCategory() {
      queryNewsByCategory(this.getCurrentCategoryId()).then((resp) => {
        this.dataList = resp.data;
      });
    },
    getCurrentCategoryId() {
      return this.categories[this.current].id;
    },
    gotoSearch() {
      this.$router.push("/news/search");
    },
    gotoDetail(url: string) {
      location.href = url;
    },
  },
};
</script>

<style scoped>
.header-search {
  display: flex;
  margin: 10px 0;
  padding: 5px 0;
}
.title-text {
  padding: 0 10px;
  font-size: 20px;
  border-right: 1px solid #f4f4f4;
}
.search_row {
  display: flex;
  flex-direction: row;
  background-color: #f4f4f4;
  border-radius: 10rem;
  margin-left: 10px;
  margin-right: 10px;
  padding-left: 10px;
  align-items: center;
  flex: 1;
}

.search-img {
  height: 20px;
  width: 20px;
  margin-left: 20px;
}

.search-text {
  color: #89939d;
  margin-left: 10px;
}
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