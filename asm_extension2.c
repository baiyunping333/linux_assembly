//http://www.ibm.com/developerworks/cn/linux/sdk/assemble/inline/
#include<stdio.h>
int main()
{
	/*here we use assembly pass a to b*/
    int a=10, b=0;
	/*
	 * %0 means b as output variable, %1 means a as input variable.
	 * inside with % prefix means it's a variable, so we use %% to indentify register.
	 * 
	 */
    asm ("movl %1, %%eax;\n\t"/*\n\t to format a good assemly style to read in disassembly*/ 
		"movl %%eax, %0;" /* list of instructions with ; or \n\t*/ 
        :"=r"(b)  	/* output */    
        :"r"(a)   	/* input */
        :"%eax"); 	/* clobbered or modified register */
	printf("b is %d\n",b);
	return 0;
}

