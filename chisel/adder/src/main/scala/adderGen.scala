// adderGen.scala
package test
 
object AdderGen extends App {
  chisel3.Driver.execute(args, () => new Adder(args(0).toInt))
}