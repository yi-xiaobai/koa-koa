const router = require("koa-router")();

router.prefix("/users");

router.get("/", function (ctx, next) {
  ctx.body = "this is a users response!  docker";
});

router.get("/bar", function (ctx, next) {
  ctx.body = "this is a users/bar response docker";
});

module.exports = router;
