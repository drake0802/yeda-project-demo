# yeda-project-demo

## 本样例工程提供了上传题目和答案的方法，请参考verilog和hls样例工程修改题目工程源文件：

1.在工程文件夹中加入problem.conf，指定题目所需要的文件，用于运行题目工程  
2.在工程文件夹中加入answer.conf，指定题目所需要的答案，用于验证题目工程  
3.hls工程需要将源工程testbench的cpp文件进行适当修改，加入结果参数写入json文件相关的逻辑（例如tb.cpp），并新建模板文件保存未修改的testbench代码（例如tb.cpp.template）  
4.在工程文件夹中加入添加题目模板文件:*.template，用于提供给答题者代码模板，（例如edge_capture.v.template或者top.cpp.template)   
5.将config.sh、build.sh、check.sh放入工程文件夹中，分别用于分离项目文件、编译、评分  
6.编写check.py，用于对用户答案进行评分，上传者可以自定义评分标准  
7.压缩成zip文件  

