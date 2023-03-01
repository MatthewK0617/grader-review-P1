CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

file=student-submission/ListExamples.java

if [[ ! -f $file ]]
then
	exit
fi

cp $file ss.java
javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
	exit $?
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples | grep -h "Failure" > out.txt

cat out.txt
