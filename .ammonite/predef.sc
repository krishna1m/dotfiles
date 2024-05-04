import $ivy.`org.playframework::play-json:3.0.2`, play.api.libs.json._, play.api.libs.json.Reads._, play.api.libs.functional.syntax._
import $ivy.`org.typelevel::cats-core:2.9.0`, cats._, cats.data._, cats.syntax.all._
import $ivy.`org.typelevel::cats-effect:3.5.1`
import $ivy.`io.circe::circe-core:0.14.1`
import $ivy.`io.circe::circe-generic:0.14.1`
import $ivy.`io.circe::circe-parser:0.14.1`
import $ivy.`co.fs2::fs2-core:3.7.0`
import $ivy.`co.fs2::fs2-io:3.7.0`
import $ivy.`co.fs2::fs2-reactive-streams:3.7.0`
import $ivy.`co.fs2::fs2-scodec:3.7.0`
import $ivy.`dev.zio::zio:2.1-RC1`, zio._
import $ivy.`dev.zio::zio-streams:2.1-RC1`, zio.ZIOAspect._, zio.stream._
import $ivy.`dev.zio::zio-http:3.0.0-RC4`, zio.http._
import $ivy.`dev.zio::zio-json:0.6.2`, zio.json._
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.Future
import scala.concurrent.Await
import scala.util.{Try, Failure, Success}
