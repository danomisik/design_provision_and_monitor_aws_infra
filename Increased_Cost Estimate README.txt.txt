Redundancy/performance/security changes:

Relational databases:
 - We will recreate database to multi-az multi-region database: N.Virginia have 3 avalaibility zones. We will create 3 MasterDBs (one in each zone).  We also will creat read replica in Ohio region because we want to be prepared for disaster recovery process in the case N.Virginia region will be down.
 - Database type: We are using db.m6g.4xlarge - database image from newest generation . This performance is enought for our use case, we dont need to upgrade to AMI with better performance.
 Storage: We are using from beginning provisioned iops EBS disks for critical applications. We are comfortable with this and will not change it.
 - Added backup storage: We also added Backup storage with size of 1000 GB.

WAF:
 - we will add WAF for security reasons
 
EKS:
 - We will start to manage Autoscaling group with EKS. Our application is dockerized. When we will use EKS, we dont need to manage machines oursefl and add another layer of security provided by AWS EKS service.
 
App server - EC2 machines:
 - EKS will manage 6 nodes ( 6 EC2 machines ). In each N. Virginia region will be 2 EC2 machines.
 - Maximum number of nodes, during a peak, will be 9 EC2 instances/ 9 nodes.
 - Operation system: Red Hat Enterprise Linux - stable, secure linux system with regular updated.
 - Storage: io2 storage - high performance storage for production
 
Web Server - EC2 machines:
 - EKS will manage 3 nodes ( 3 EC2 machines ). In each N. Virginia region will be 1 EC2 machine.
 - Maximum number of nodes, during a peak, will be 6 EC2 instances/ 6 nodes.
 - Operation system: Red Hat Enterprise Linux - stable, secure linux system with regular updated.
 - Storage: io2 storage - high performance storage for production
Route 53:
 - We need to have DNS name for our application. We will use AWS Route 53 for this.
 
AWS Global Accelerator:
 - We will also integrate AWS Global Accelerator to decrease request time.


Monthly estimates was overally increased to 12481.2 USD

