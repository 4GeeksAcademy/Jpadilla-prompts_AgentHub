# 📑 PRUEBA TÉCNICA: ANÁLISIS DE VENTAS Y COMPORTAMIENTO DEL CLIENTE
**Compañía:** Danta Analytics S.A.  
**Consultor:** Jorge Andrés Padilla Arias  
**Fecha de Entrega:** Lunes 29 de junio de 2026  
**Destinatario:** Dirección de Ventas / Comité Evaluador  

---

## 🧭 PARTE 1: COMPRENSIÓN DEL REQUERIMIENTO

### 1. Resumen del Requerimiento en Propias Palabras
El objetivo central consiste en transformar la data histórica transaccional de *"Online Retail II"* en un activo estratégico para la Dirección de Ventas. El análisis persigue tres metas operacionales y comerciales críticas:
1. **Segmentar la cartera de clientes** bajo una metodología de valor (RFM) para aislar el núcleo que sostiene la rentabilidad.
2. **Identificar patrones estacionales y geográficos** de consumo.
3. **Realizar una auditoría de la logística inversa** mediante el mapeo exhaustivo de devoluciones por país y temporalidad.

### 2. Tres Preguntas Clave a Responder con los Datos
* 📊 ¿Qué proporción de nuestros ingresos totales es generada por el segmento "Champions" (Clientes de alto valor)?
* 🌍 ¿Existe un patrón estacional o geográfico crítico donde las devoluciones se concentren en meses o países específicos?
* 📦 ¿Cuáles son los 10 SKU o productos con mayor frecuencia e intensidad de devoluciones?

### 3. Estrategia de Abordaje del Análisis
* **Fase 1 (Ingesta y Calidad):** Limpieza inicial de nulos en orígenes de datos.
* **Fase 2 (Modelado Dimensional):** Diseño de esquema en estrella en Power BI.
* **Fase 3 (Cálculo Avanzado RFM):** Clasificación por percentiles dinámicos en DAX.

---

## 📈 PARTE 2: RESUMEN EJECUTIVO Y HALLAZGOS (INSIGHTS)

### 1. Segmentación RFM
El **15% de la base de clientes activos** pertenece al segmento *"Champions"*. Este subgrupo estratégico concentra **más del 60% del Revenue total neto** de la compañía.

### 2. Patrón de Logística Inversa (Devoluciones)
* 📅 **Estacionalidad:** Pico crítico detectado en **Enero y Febrero**.
* 🗺️ **Geografía:** Europa continental registra tasas porcentuales de devolución más altas por transacción en comparación al Reino Unido.

### 3. Concentración Crítica del Catálogo
> 💡 **Outlier Detectado:** El producto **SKU 23166 (Medium Ceramic Top Storage Jar)** representa por sí solo el **73.9% de las pérdidas totales por devoluciones** monetarias debido a un evento masivo de cancelación de 74,215 unidades.
