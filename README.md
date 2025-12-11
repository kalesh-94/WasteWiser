# WasteWiser: Smart Waste Pickup Scheduler

WasteWiser is a role-based Java web application that streamlines waste pickup requests, agent assignment, and real-time task tracking. The platform improves coordination between citizens, admins, and field agents through a centralized and transparent workflow.

---

## 🚧 Problem
Traditional waste collection relies on manual communication, resulting in:
- Delayed pickups  
- Mismanaged task assignments  
- No visibility into request progress  
- Poor coordination between citizens, agents, and admin staff  

---

## ✅ Solution
WasteWiser solves these issues by providing:
- A citizen portal to request pickups and track progress  
- An admin dashboard to assign agents, manage users, and monitor tasks  
- An agent interface to update real-time pickup statuses  
- A centralized database for end‑to‑end transparency  

Built using **Java, Servlets, JSP, JDBC, Tomcat, and XAMPP (MariaDB)**.

---

## 🌟 Impact
- Faster and more reliable waste collection  
- Transparent status tracking for citizens  
- Efficient admin scheduling and user management  
- Real‑time field updates for better civic coordination  

---

## 🧰 Tech Stack

| Layer | Technology |
|------|------------|
| Frontend | HTML, CSS, JSP |
| Backend | Java Servlets |
| Database | MySql (XAMPP) |
| ORM/Connection | JDBC |
| Server | Apache Tomcat |

---

## 🗂️ Project Structure

```
WasteWiser/
├── Java Resources
│   └── src/com.waste
│       ├── addAgents.java
│       ├── AdminLogin.java
│       ├── agentChangePassword.java
│       ├── agentLogin.java
│       ├── agentRegister.java
│       ├── AssignPickup.java
│       ├── citizenChangePassword.java
│       ├── citizenLogin1.java
│       ├── citizenRegister.java
│       ├── DbConnection.java
│       ├── GetSetAgentId.java
│       ├── GetSetCitizenId.java
│       ├── submitPickupRequest.java
│       └── updatePickupStatus.java
│
├── WebContent
│   ├── META-INF/
│   ├── WEB-INF/
│   │   ├── lib/
│   │   └── web.xml
│   │
│   ├── index.html
│
│   ├── a_adminLogin.html
│   ├── b_adminDashboard.html
│   ├── c_citizenLogin.html
│   ├── d_citizenRegister.html
│   ├── e_citizenDashboard.html
│   ├── f_agentLogin.html
│   ├── g_agentRegister.html
│   ├── h_addAgents.html
│
│   ├── i_adminviewAgents.jsp
│   ├── j_agentDelete.jsp
│   ├── k_viewcitizens.jsp
│   ├── l_citizenDelete.jsp
│   ├── m_adminProfile.html
│   ├── n_pickupReqCitizen.html
│   ├── o_adminViewRequest.jsp
│   ├── p_requestDelete.jsp
│   ├── q_adminAssignAgents.jsp
│   ├── r_agentDashboard.html
│   ├── s_agentViewAssignedPickups.jsp
│   ├── t_agentProfile.jsp
│   ├── u_changePassCitizen.jsp
│   ├── v_errorPageCitizen.html
│   ├── w_changePassAgent.jsp
│   ├── x_errorPageAgent.html
│   ├── y_errorAdmin.html
│   └── z_citizenProfile.jsp
│
├── Libraries/
├── JavaScript Resources/
└── build/
```

---

## 📑 Pages Overview

### 🔐 Authentication Pages
- **Admin:** a_adminLogin.html  
- **Citizen:** c_citizenLogin.html, d_citizenRegister.html  
- **Agent:** f_agentLogin.html, g_agentRegister.html  

---

### 🛠️ Admin Pages
- b_adminDashboard.html  
- h_addAgents.html  
- i_adminviewAgents.jsp  
- j_agentDelete.jsp  
- k_viewcitizens.jsp  
- l_citizenDelete.jsp  
- o_adminViewRequest.jsp  
- p_requestDelete.jsp  
- q_adminAssignAgents.jsp  
- m_adminProfile.html  
- y_errorAdmin.html  

---

### 👤 Citizen Pages
- e_citizenDashboard.html  
- n_pickupReqCitizen.html  
- u_changePassCitizen.jsp  
- v_errorPageCitizen.html  
- z_citizenProfile.jsp  

---

### 🚛 Agent Pages
- r_agentDashboard.html  
- s_agentViewAssignedPickups.jsp  
- t_agentProfile.jsp  
- w_changePassAgent.jsp  
- x_errorPageAgent.html  

---

### 🏠 Common Page
- index.html — Application landing page  

---

## 🛠️ How to Run the Project (XAMPP + Tomcat)

### 1️⃣ Start XAMPP Services
- Start **Apache**
- Start **MySQL (MariaDB)**

---

### 2️⃣ Create Database in phpMyAdmin
Visit:
```
http://localhost/phpmyadmin
```

Create database:
```
wastewiser
```

Import tables using your SQL file.

---

### 3️⃣ Update DB Credentials (DbConnection.java)
```
String url = "jdbc:mysql://localhost:3306/wastewiser";
String username = "root";
String password = ""; // XAMPP default
```

---

### 4️⃣ Run on Tomcat
- Import project into Eclipse/IntelliJ  
- Add Tomcat server  
- Run the project  

Access application:
```
http://localhost:8080/WasteWiser
```

---

## 📸 Screenshots

Create a `screenshots/` folder and add your demo images.

Example:

```
## Screenshots

### 🏠 Home Page
![Home](./screenshots/home.png)

### 🙋 Citizen Request Page
![Citizen Request](./screenshots/request.png)

### 🛠️ Admin Dashboard
![Admin](./screenshots/admin_dashboard.png)

### 🚛 Agent Panel
![Agent](./screenshots/agent_panel.png)
```

---


---



---

## 📜 License
Kalesh Patil.












<img width="1896" height="909" alt="image" src="https://github.com/user-attachments/assets/9a3dee2d-3dd0-4ba2-bd5b-ec875a24e785" />
