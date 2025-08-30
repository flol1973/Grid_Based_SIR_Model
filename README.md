# 🦠 Grid-based SIR Epidemic Modelling

This project models the spread of an epidemic using a **grid-based SIR framework**. It was developed as part of the *ID5090 Complex Systems course project* at IIT Madras. The simulation demonstrates how local interactions can give rise to emergent large-scale epidemic dynamics.

---

## 🔹 Model Overview
- **Population:** Represented on an N × N grid, where each point is an individual.  
- **States:** Susceptible (S), Infected (I), Quarantined (Q), and Recovered (R).  
- **Infection Spread:** Probabilistic transmission occurs when a susceptible individual is within a defined infection radius (R) of an infected neighbour.  
- **Recovery:** After a fixed recovery time, infected individuals transition to recovered and gain immunity.  
- **Quarantine:** Triggered when infection exceeds a threshold, symptomatic individuals are isolated while asymptomatic carriers continue to spread infection.  
- **Common Places:** Simulates environments like markets/transport hubs, where random agents congregate and transmission risk is amplified.  

---

## 🔹 Hallmarks of Complexity
- **Emergent Behaviour:** Large-scale epidemic waves arise from simple local interactions.  
- **Non-linearity:** Epidemic growth and collapse are highly sensitive to infection rate, recovery time, and quarantine.  
- **Stochastic Dynamics:** Probabilistic infections and random initialisation make each run unique.  
- **Phase Transitions:** Epidemic thresholds appear, distinguishing between the outbreak dying out vs. a whole epidemic.  
- **Multi-scale Interactions:** Local contacts lead to global infection patterns.  

---

## 🔹 Key Results
- **Epidemic Thresholds:** The system shows critical values of infection probability and recovery time, below which epidemics die out and above which they spread widely.  
- **Peak Infection Rate:** Strongly dependent on infection probability; mitigated by quarantine.  
- **Emergent Patterns:** Outbreaks starting in the grid centre spread far more effectively than those at edges (similar to urban vs. rural dynamics).  

---

## 🔹 Diagnostics
- Sanity checks comparing infection vs. recovery curves match the expected SIR differential equation trends.  
- Simulations align qualitatively with classical deterministic SIR models but reveal additional stochastic variability.  

---

## 🔹 Data & Analysis
The model produces rich time-series data:  
- Susceptible, Infected, Quarantined, Recovered vs. time  
- Peak infection size and timing  
- Duration of epidemic under different interventions  

This allows for **forecasting**, **policy testing** (e.g., quarantine timing), and **comparative scenario analysis**.

---

## 🔹 Technologies Used
- **Language:** MATLAB  
- **Concepts:** SIR models, agent-based simulation, stochastic processes, complex systems analysis  

---

## 🔹 References
- [3Blue1Brown – Simulating an epidemic](https://youtu.be/gxAaO2rsdIs)  
- [SIR differential equation model – Medium](https://medium.com/@shaliniharkar/sir-model-for-spread-of-disease-the-differential-equation-model-7e441e8636ab)  
- MATLAB documentation  
