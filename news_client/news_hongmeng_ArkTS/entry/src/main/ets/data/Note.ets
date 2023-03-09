/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
export class Note {
  private id: string;
  private name: string = '';

  public getId() {
    return this.id
  }

  public setId(id: string) {
    this.id = id
  }

  public getName() {
    return this.name
  }

  public setName(name: string) {
    this.name = name
  }
}