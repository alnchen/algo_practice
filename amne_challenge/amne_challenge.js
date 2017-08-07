var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

function subrangeDifference(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                var allText = rawFile.responseText;
                console.log(allText);
            }
        }
    }
    rawFile.send();
}

subrangeDifference("file:///Users/alnchen/Desktop/aA/algos/amne_challenge/test1.txt");
