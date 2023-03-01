import request from '../utils/request'


export const queryCategories = () => {
	return request('', 'news/categories', 'get').then(resp => resp.data)
}

export function queryNewsByCategory(categoryId) {
	return request('', `news/news?categoryId=${categoryId}`, 'get').then(resp => resp.data)
}

export function search(keyword) {
	return request('', `news/newsBySearch?keyword=${keyword}`, 'get').then(resp => resp.data)
}
