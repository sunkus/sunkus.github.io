# IP 地址查询站点

仿 ip111.cn 的 IP 查询首页，纯前端、零依赖、单文件，可直接部署到 GitHub Pages / Vercel / Netlify / 任意静态托管。

## 功能

- 公网 IPv4 / IPv6 出口地址检测
- 归属地（城市、地区、国家、ISP/ASN）
- 国内 / 国外 / 谷歌 三路出口 IP（兼容原站布局）
- WebRTC 真实本地 IP 探测
- User-Agent、时区、语言等环境信息
- 多接口自动降级，单接口失败时不影响整体

## 部署到 GitHub Pages

1. 新建公开仓库，命名为 `你的用户名.github.io`（这是你的专属站点，直接访问 `https://用户名.github.io`）；普通仓库则访问 `https://用户名.github.io/仓库名`。
2. 把 `index.html` 上传到仓库根目录（可用网页端 Add file → Upload files，也可 `git push`）。
3. 进入仓库 **Settings → Pages**，Source 选 `Deploy from a branch`，Branch 选 `main`、目录选 `/ (root)`，点 Save。
4. 等待 1–3 分钟，顶部出现绿色提示条即部署成功。

## 自定义域名（可选）

1. 仓库根目录新建无后缀文件 `CNAME`，内容填你的域名，例如 `ip.example.com`。
2. DNS 控制台添加：
   - 根域名：4 条 A 记录指向 `185.199.108.153` / `109` / `110` / `111.153`
   - 子域名：CNAME 指向 `用户名.github.io`
3. **Settings → Pages → Custom domain** 填入域名并 Save，再勾选 **Enforce HTTPS**。

## 自检清单

- [ ] 仓库为 Public（私有仓库免费版不支持 Pages）
- [ ] 文件名是 `index.html`（注意大小写）
- [ ] Pages 的 Source 已设为 `main` + `/ (root)`
- [ ] 国内访问时若 IP 接口超时，可换成国内自建接口（见下方）

## 换成自己的 IP 接口

默认使用公开接口（`ipify` / `ipapi.co` / `ipwho.is`）。若要换成自建或国内接口，修改 `index.html` 中的三个数组即可：

```js
const GEO_APIS = [ { name:'自建', url:'https://你的接口/geo', fn: d => d.ip ? d : null } ];
const IPV4_APIS = [ 'https://你的接口/ipv4' ];  // 返回 {ip:"x.x.x.x"}
```

自建接口只需返回 `{"ip":"x.x.x.x","city":"","region":"","country":"","org":""}` 结构即可。

## 说明

仅提供 IP 查询功能，不提供其他服务。
