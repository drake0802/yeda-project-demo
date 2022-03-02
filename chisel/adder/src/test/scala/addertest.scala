// addertest.scala
package test
 
import scala.util._
import chisel3.iotesters._
 
class AdderTest(c: Adder) extends PeekPokeTester(c) {
  val randNum = new Random(1000)
  for(i <- 0 until 10) {
    val a = randNum.nextInt(256)
    val b = randNum.nextInt(256)
    poke(c.io.a, a)
    poke(c.io.b, b)
    step(1)
    expect(c.io.s, (a + b) & 0xff)
    expect(c.io.cout, ((a + b) & 0x100) >> 8)
  }
}

object AdderTestGen extends App {
  chisel3.iotesters.Driver.execute(args, () => new Adder(8))(c => new AdderTest(c))
}