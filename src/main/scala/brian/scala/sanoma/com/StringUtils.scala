package brian.scala.sanoma.com

/**
 * Created by brian on 24/10/14.
 */

object StringUtils {
  implicit class StringImprovements(val s: String) {
    import scala.util.control.Exception._
    def toIntOpt = catching(classOf[NumberFormatException]) opt s.toInt
  }
}
