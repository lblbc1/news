import axiosInstance, { AxiosResponseProps } from '@/uitls/request';

export const queryCategories = () => {
	return axiosInstance.get('news/categories');
}

export const queryNewsByCategory = (categoryId: string) => {
	return axiosInstance.get('news/news?categoryId='+categoryId);
}

export function search(keyword: string) {
	return axiosInstance.get(`news/newsBySearch?keyword=${keyword}`);
}