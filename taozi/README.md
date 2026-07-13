# 桃子商城 - JavaEE 课程项目

## 环境要求

- JDK 8+
- MySQL 8.x
- IntelliJ IDEA（社区版免费）

## 第一步：创建数据库

打开 cmd，输入：

```cmd
cd "C:\Program Files\MySQL\MySQL Server 8.4\bin"
mysql -u root -p --default-character-set=utf8mb4
```

输入密码后，看到 `mysql>` 提示符，执行：

```sql
source D:\myWorkSpace\taozi\db\schema.sql
```

等执行完输入 `exit` 退出。

> 如果 MySQL 安装路径不同，把第一行的路径换成你的实际路径。

## 第二步：改数据库密码

用记事本打开 `src\main\resources\application.yml`，找到这一行：

```yaml
    password: 123123
```

把 `123123` 改成你的 MySQL root 密码。

## 第三步：用 IDEA 打开项目

1. 打开 IntelliJ IDEA
2. File → Open → 选择 `D:\myWorkSpace\taozi` 文件夹
3. 等待右下角进度条跑完（Maven 下载依赖，首次可能需要 3-5 分钟）

## 第四步：运行项目

1. 在左侧项目树找到：`src/main/java/com/taozi/TaoziApplication.java`
2. 右键 → **Run 'TaoziApplication'**
3. 等控制台出现 `Started TaoziApplication in ...` 说明启动成功

## 第五步：打开浏览器

访问：**http://localhost:8080**

## 预置账号

| 角色 | 用户名 | 密码 |
|------|--------|------|
| 管理员 | admin | 123456 |
| 普通用户 | test | 123456 |

> 注意：这里的密码 123456 是商城账号密码，和 MySQL 数据库密码是两回事。

## 功能测试

### 前台（普通用户）

1. 注册新账号，或用 `test / 123456` 登录
2. 首页浏览商品，点分类筛选
3. 点商品进入详情页，点"加入购物车"
4. 右上角进入购物车，改数量、删商品
5. 点"提交订单"下单
6. "我的订单"查看订单详情

### 后台（管理员）

1. 用 `admin / 123456` 登录
2. 右上角出现"后台管理"，点进去
3. 商品管理：添加、编辑、删除商品
4. 客户管理：添加、编辑、删除用户
5. 分类管理：添加、删除分类

## 停止项目

在 IDEA 控制台点红色方块停止按钮。
