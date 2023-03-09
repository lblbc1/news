import { createRouter, createWebHashHistory, RouteRecordRaw } from "vue-router";
const routes: Array<RouteRecordRaw> = [
	{
		path: "/",
		name: "NewsList",
		meta: {
			title: "首页",
			keepAlive: true
		},
		component: () => import("../views/AppList.vue"),
	},{
		path: "/news/search",
		name: "search",
		meta: {
			title: "搜索",
			keepAlive: true
		},
		component: () => import("../views/Search.vue"),
	},
];
const router = createRouter({
	history: createWebHashHistory(),
	routes
});
export default router;