# yeda-project-demo

## 本样例工程提供了上传题目和答案的方法，请参考verilog和hls样例工程修改题目工程源文件：

1.在原工程中加入problem.conf，指定题目所需要的文件，用于运行题目工程  
2.在原工程中加入answer.conf，指定题目所需要的答案，用于验证题目工程  
3.在原工程中加入添加题目模板文件:*.template，hls工程例如top.cpp.template和tb.cpp.template,verilog工程例如edge_capture.v.template，用于提供给答题者代码模板     
4.将config.sh、build.sh、check.sh放入原工程中，分别用于分离项目文件、编译、评分  
5.编写check.py，用于对用户答案进行评分，上传者可以自定义评分标准  
6.压缩成zip文件  

