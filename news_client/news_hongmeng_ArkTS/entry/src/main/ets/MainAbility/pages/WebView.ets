import router from '@ohos.router';
@Entry
@Component
struct WebView {
  private url: string = router.getParams()['url'];
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private webController: WebController = new WebController();

  build() {
    Navigation() {
      Web({
        src: this.url,
        controller: this.webController
      })
    }.width('100%')
  }
}