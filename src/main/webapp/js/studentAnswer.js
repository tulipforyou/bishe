$(function(){

    var data=[];
    var sid=[];
    var checked='';
    var $tr;
    console.log($("#tbodyId"));
    console.log($("#tbodyId input[type='checkbox']"));
    var i=0;
    $("#submitAnswer").click(function(event) {
        $("#tbodyId input[type='checkbox']").each(function(index, el) {
            checked=$(this).prop('checked');
            console.log(checked);
            if(checked){

                $tr=$(this).parent().parent().parent();
                console.log($tr);

               //data[$tr.find('#no').text()]=document.getElementById('sasa').value;
                sid[i]=$tr.find('#no').text();
                data[i]=document.getElementById('sasa').value;
                i++;
            }
        });
        console.log(data);

        /* Act on the event */
        $.ajax({
            url: 'checkAnswer',
            traditional: true,
            type: 'POST',
            dataType:'json',
            contentType:'application/json;charset=utf-8',
            data: JSON.stringify(data),
           /* data: {
                "data":data
            },*/
            success:function(data){
                alert(data);
                window.location.reload();
            },
            error:function(){
                console.log("that is wrong!");
            }
        })

    });

});