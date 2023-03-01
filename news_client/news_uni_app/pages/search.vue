//厦门大学计算机专业 | 前华为工程师
//专注《零基础学编程系列》 http://lblbc.cn/blog
//包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
//公众号：蓝不蓝编程
<template>
	<view class="page-wrapper">
		<view class="search_wrapper">
			<view class="search_row">
				<image class="search-img" src="/static/images/search.png"></image>
				<input class="search-input" placeholder="请输入搜索关键词" @input="_bindinput" />
			</view>
			<view class="search-text" :auto-focus="true" @click="searchApp">搜索</view>
		</view>

		<view class="row" :data-id="item.id" v-for="(item, index) in apps" :key="item.k" @click="gotoDetail(item.link)">
			<div class="col">
				<div class="news-title">{{ item.title }}</div>
				<div class="news-comment">
					 {{ item.author }} {{ item.commentCount }}评论
				</div>
			</div>
			<image class="img" :src="item.imgUrl" ></image>
		</view>
	</view>
</template>
<script>
	import {
		search
	} from '@/common/api'
	export default {
		data() {
			return {
				apps: [],
				keyword: ''
			}
		},
		methods: {
			_bindinput(e) {
				this.keyword = e.detail.value
			},
			searchApp() {
				search(this.keyword).then(resp => {
					this.apps = resp.data
				})
			},
			gotoDetail(url) {
				location.href = url;
			}
		}
	}
</script>
<style>
	.page-wrapper {}

	.search_wrapper {
		display: flex;
		background-color: #418df9;
		padding-top: 10px;
		padding-bottom: 10px;
	}

	.search_row {
		display: flex;
		flex-direction: row;
		background-color: white;
		border-radius: 10rem;
		margin-left: 1rem;
		margin-right: 1rem;
		padding-top: 5px;
		padding-bottom: 5px;
		align-items: center;
		flex: 1;
	}

	.search-img {
		height: 20px;
		width: 20px;
		margin-left: 10px;
	}

	.search-text {
		line-height: 30px;
		color: #ffffff;
		margin-left: 10px;
		margin-right: 10px;
	}

	.tab-row {
		padding-top: 15px;
		width: 100%;
		display: flex;
		align-items: center;
		box-sizing: border-box;
		white-space: nowrap;
		background-color: white;
	}

	.tab {
		width: 80px;
		margin-left: 10px;
		margin-right: 10px;
		display: inline-block;
		padding-bottom: 10px;
		text-align: center;
	}

	.tab-selected {
		border-bottom: 2px solid;
		color: #418df9;
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
