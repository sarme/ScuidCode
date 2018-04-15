var mynameis = function(){
    "use strict"

    var introIndex = 0;

    var opts = {
        target: undefined
    };

    var introductions = [
        'My name is Chris.', // english
        'Mi nombre es Chris.', // spanish
        '私の名前はクリスです.', // japanese
        'Mon nom est Chris.',  // french
        'Is é mo ainm Chris.',  // irish
        'Mi chiamo Chris.', // Italian
        'Chris mupong tlhInganpu.' // Klingon
    ];

    function init(target){
      opts.target = target;
      
      setInterval(mynameis.nextName, 5000);
    }

    function nextName(){
        opts.target.innerHTML = introductions[introIndex++];

        if(introIndex >= introductions.length)
            introIndex = 0;
    }

    return {
        init: init,
        nextName: nextName
    }
}();