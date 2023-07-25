import $ivy.`org.typelevel::cats-core:2.9.0`, cats._, cats.syntax.all._
import $ivy.`dev.zio::zio:2.0.15`
import $ivy.`org.typelevel::cats-effect:3.5.1`
import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.duration._
import scala.concurrent.Future
import scala.util.{Failure, Success}
import scala.concurrent.Await
