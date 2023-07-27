import $ivy.`org.typelevel::cats-core:2.9.0`, cats._, cats.syntax.all._
import $ivy.`org.typelevel::cats-effect:3.5.1`
import $ivy.`io.circe::circe-core:0.14.1`
import $ivy.`io.circe::circe-generic:0.14.1`
import $ivy.`io.circe::circe-parser:0.14.1`
import $ivy.`co.fs2::fs2-core:3.7.0`
import $ivy.`co.fs2::fs2-io:3.7.0`
import $ivy.`co.fs2::fs2-reactive-streams:3.7.0`
import $ivy.`co.fs2::fs2-scodec:3.7.0`
import $ivy.`dev.zio::zio:2.0.15`
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.Future
import scala.util.{Failure, Success}
import scala.concurrent.Await
