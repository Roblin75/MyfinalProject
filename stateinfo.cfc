component{
    function obtainUser(isLoggedIn=0, 
                        firstName="", 
                        lastName="",
                        email="", 
                        acctNumber="", 
                        isAdmin=0
        
        
    ){
        return{
            "isLoggedIn": arguments.isLoggedIn,
            "firstName":arguments.firstName,
            "lastName": arguments.lastName,
           " email": arguments.email,
            "acctNumber": arguments.acctNumber,
            "isAdmin": arguments.isAdmin

        }
    }
    function emailisUnique(email){
        var qs = new query(datasource=application.dsource);
        qs.setSql("select * from people where email=:email");
        qs.addParam(name="email",value=arguments.email);
        return qs.execute().getResult().recordcount == 0;
        }
    function processNewAccount(formData){
            
            if(emailIsUnique(formData.email)){
            } else {
            return {success:false,
            message:"That email is already in our system. Please
            login"
            };
            }
        if (emailUnique(formdata.email)){
        
            var newid = createUUID();
            if( addPassword(newId, formData.password)){
                addAccount(newid,formData.title, formdata.firstName,formData.lastName, formData.email);
                returnMe.success = true;
                returnMe.message = "Account made";
            
            }else{
                returnMe.message = "there is a problem please try again";
               
            }
        }else{
            returnMe.message = "that email is already in our database. please log in";
        }
        return returnMe;


        }
    function emailUnique(required string email){

        var qs = new query(datasource = application.dsource);
        qs.setSql("select * from people where email=:email");
       
        qs.addParam(name="email",value=arguments.email);
        return qs.execute().getResult().recordcount==0;



    }
    function addPassword(id,password){
        try {
            var qs = new query(datasource = application.dsource);
            qs.setSql("insert into passwords (personid, password)
            values (:personid, :password) ");
            qs.addParam(name = "personid", value = arguments.id);
            qs.addParam(name = "password", value = hash(arguments.password, "SHA-512"));
            qs.execute();
            return true;
            }
            catch(ary err){
            return false;
            }
            }




        function addAccount(id,title, firstName, LastName, email){
                try {
                    var qs = new query(datasource = application.dsource);
                    qs.setSql("insert into people (personid,title, firstName, lastName, email)
                    values (:personid,:title, :firstName, :lastName, :email) ");
                    qs.addParam(name = "personid", value = arguments.id);
                    qs.addParam(name = "title", value = arguments.title);
                    qs.addParam(name = "firstName", value = arguments.firstName);
                    qs.addParam(name = "lastName", value = arguments.lastName);
                    qs.addParam(name = "email", value = arguments.email);
                <!---    qs.addParam(name = "password", value = hash(arguments.password, "SHA-512"));
                --->
                    qs.execute();
                    return true;
                    }
                    catch(ary err){
                    return false;
                    }
                    }


            function logMeIn(username, password){
                    
                        var qs = new query(datasource = application.dsource);
                        qs.setSql("select * from people
                         inner join passwords on people.personid= passwords.personid
                        where email = :email and passwords.password=:password");
                        qs.addParam(name = "email", value = arguments.username);
                        qs.addParam(name = "password", value = hash(arguments.password, "SHA-512"));
                        var results= qs.execute().getResult();
                        
                        return "success";
                      
            }




            function obtainUser(
                isLoggedIn = false,
                firstname="",
                lastname="",
                email="",
                acctNumber="")
               {
                return {
                isLoggedIn:arguments.isLoggedIn,
                firstname:arguments.firstname,
                lastname:arguments.lastname,
                email:arguments.email,
                acctNumber:arguments.acctNumber
                };
                }

                function addPassword(id, password){
                    try {
                    var qs = new query(datasource = application.dsource);
                    qs.setSql("insert into passwords (personid, password)
                    values (:personid, :password) ");
                    qs.addParam(name = "personid", value = arguments.id);
                    qs.addParam(name = "password", value = hash(arguments.password, "SHA-256"));
                    qs.execute();
                    return true;
                    }
                    catch(ary err){
                    return false;
                    }
                    }
            
            }