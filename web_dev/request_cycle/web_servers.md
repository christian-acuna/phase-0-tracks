What are some of the key design philosophies of the Linux operating system?
- Linux OS begins with the premise that the user is computer literate from the start and provides a large set of simple tools that do their intended task really well.   
- It also advocates that small is beautiful which ties nicely with the tenet that each program does one thing well.
- It also inherits its philosophy from the UNIX operating system which emphasizes simple, short, clear, and modular code that is easy to maintain and repurpose.

In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

- A virtual private server is composed of a physical machine that is divided into several virtual machines each with their own OS and allocated server resources. VPS differs from shared hosting in that each account on a VPS in isolated from the others on the same machine. This means that other websites hosted on the same machine won't affect the performance of yours. You also get complete root access to the server as if it was your own private server. VPS hosting is generally more expensive than shared hosting but with the added cost you get more flexibility over your server's configuration.  


Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?
- More prone to make deleterious mistakes as root user like rm -rf *
- A vulnerability on malicious software can cause more damage because you gave it root access.
- You often don't need to have root rights for most of the work you do.
- Also, every hacker / virus knows that a root account exists so will begin an attack at root. Therefore, root login should be disabled.
