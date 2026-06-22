# Especificación Técnica de Producto: AgentHub Admin Dashboard

## 1. Descripción del Producto
AgentHub es una plataforma SaaS diseñada para el alquiler y despliegue de agentes de IA empresas configurados con habilidades (`skills`) específicas. El objetivo de este prototipo es servir como un panel de administración interno funcional y estático que permita al equipo fundador validar los flujos operacionales principales, la consistencia de los datos hardcodeados y la adaptabilidad de la interfaz antes de proceder a la integración con el backend.

**Usuario Administrador:** Perfil técnico/operativo interno encargado de auditar la estabilidad de los agentes, gestionar el catálogo de habilidades, supervisar la facturación de las contrataciones y diagnosticar fallas críticas mediante logs en tiempo real.

---

## 2. Stack Tecnológico y Restricciones
* **Estructura:** HTML5 semántico y limpio.
* **Estilos:** Tailwind CSS integrado mediante CDN.
* **Interactividad:** JavaScript Vanilla (JS puro), manipulando el DOM de forma directa. Sin frameworks (No React, No Vue) ni dependencias externas.
* **Datos:** 100% hardcodeados en el documento, modelando escenarios realistas de producción.
* **Modo Oscuro:** Sincronizado a nivel global utilizando la utilidad `dark:` de Tailwind CSS mediante la conmutación de la clase `.dark` en la etiqueta `<html>`.

---

## 3. Especificaciones por Sección

### Barra Superior (TopBar) y Navegación Lateral (Sidebar)
* **Navegación Lateral Persistente:** Un contenedor fijo (`fixed left-0`) de ancho `w-64` con fondo gris pizarra (`bg-slate-900`). Contiene el logotipo de AgentHub y una lista vertical de 6 enlaces correspondientes a las secciones del sistema, usando iconos vectoriales SVG claros y estados `:hover` activos con sutiles transiciones.
* **Barra Superior de Control:** Elemento alineado a la parte superior que se extiende horizontalmente cubriendo el ancho restante. Contiene el título dinámico de la sección activa y un botón tipo Switch/Toggle en el extremo derecho para alternar el modo oscuro (`dark mode`).
* **Interactividad del Modo Oscuro:** Al hacer clic en el Switch, un script de JS conmuta la clase `dark` en el elemento raíz del DOM, alterando instantáneamente los colores de fondo de `bg-white` a `bg-slate-900` y el texto de `text-slate-800` a `text-slate-100`.

### 3.1. Dashboard
* **Cuadrícula de Métricas (Grid 2×2 / 4x1 responsive):** Cuatro tarjetas independientes distribuidas uniformemente. Cada tarjeta presenta un borde redondeado (`rounded-xl`), una sombra tenue (`shadow-sm`) y un color de acento diferenciado:
    1.  *Ingresos Totales (Mes Actual):* Acento verde (`text-emerald-500`), valor hardcodeado `$45,280.00`.
    2.  *Pérdida por Descuentos/Cupones:* Acento rojo (`text-rose-500`), valor hardcodeado `$3,150.00`.
    3.  *Agentes Activos en Clientes:* Acento azul (`text-blue-500`), valor hardcodeado `1,240`.
    4.  *Agentes con Fallas Críticas:* Acento naranja/ámbar (`text-amber-500`), valor hardcodeado `14`.
* **Área Analítica Semanal:** Un contenedor de ancho completo (`w-full`) ubicado debajo de las tarjetas con un borde discontinuo (`border-dashed border-2 border-slate-300 dark:border-slate-700`) y altura fija (`h-64`). Una etiqueta centrada textualmente simulará el marcador de posición para el gráfico analítico de rendimiento semanal.

### 3.2. Gestión de Usuarios
* **Tabla de Registros:** Listado tabular con cabeceras explícitas (`Nombre`, `Email`, `Plan`, `Estado`). El estado de los usuarios emplea badges redondeados pequeños (Ej: "Premium" en fondo azul, "Activo" en fondo verde).
* **Dropdown de Acciones (⋮):** Botón posicionado en la celda derecha de cada fila. Al accionarse mediante clic, despliega una capa flotante (`absolute`) indexada en el eje Z (`z-10`) con las opciones "Ver detalle" y "Eliminar".
* **Modal de Detalle del Usuario:** Overlay que cubre la pantalla al pulsar "Ver detalle". Muestra el expediente completo estructurado (Fecha de alta, volumen de tokens consumidos, ID de pasarela de pago). Se cierra presionando una equis (`✕`), un botón inferior de cierre o haciendo clic en el fondo oscuro translúcido (`backdrop-blur`).

### 3.3. Gestión de Agentes
* **Tabla de Flota de Agentes:** Columnas para `Nombre de Agente`, `Propietario (Cliente)`, `Estado` (`Activo` / `Inactivo` / `Fallando` representados por círculos de color semafórico).
* **Skills Colapsables:** Debajo de la información básica del agente, un botón expandible rotulado como "Ver Habilidades" revela al hacer clic una lista horizontal de badges con transiciones suaves de CSS (`transition-all duration-300`).
* **Acción "Configurar":** Al seleccionarla en el menú dropdown, se dispara un modal que expone un área de texto bloqueada con el *System Prompt* nativo del agente para auditoría de ingeniería lingüística.

### 3.4. Catálogo de Skills
* **Sección Informativa Contextual:** Banner superior con fondo suave (`bg-indigo-50 dark:bg-slate-800`) que define técnicamente qué es una "skill" (módulos funcionales de herramientas o APIs accesibles por los agentes).
* **Tarjetas del Catálogo:** Grid de bloques que exponen el nombre de la habilidad (ej. *Web Scraper Tool*, *Google Calendar Sync*), descripción corta de su alcance y un contador numérico destacado que refleja la cantidad de instancias de agentes que la tienen inyectada en su núcleo.
* **Acciones Estáticas:** Cada bloque incluye su respectivo dropdown para "Ver detalle" de la firma de la función o "Eliminar" la skill del catálogo global.

### 3.5. Contrataciones de Agentes
* **Registro Histórico y Activo:** Tabla detallada que lista contratos de renta vigentes e históricos, incluyendo `Cliente corporativo`, `Agente alquilado`, `Habilidades vinculadas`, `Ventana temporal (Fechas)` y el `Monto consolidado pagado`.
* **Modal de Desglose Financiero:** Al presionar "Ver detalle", el modal emergente muestra una factura desglosada que separa el coste base del agente de IA versus el valor individual tasado por cada skill activa asociada al contrato.

### 3.6. Log de Errores
* **Consola de Diagnóstico de Fallas:** Listado ordenado cronológicamente con `Timestamp`, `Nombre del Agente`, `Tipo de Error` y `Mensaje de excepción corto`.
* **Badges de Severidad:** Uso riguroso de colores para clasificación visual inmediata:
    * `Fatal / Runtime Crash`: Fondo rojo brillante (`bg-red-100 text-red-800`).
    * `Timeout Warning`: Fondo amarillo (`bg-amber-100 text-amber-800`).
    * `API Throttling`: Fondo morado (`bg-purple-100 text-purple-800`).
* **Resolución Directa:** El menú de acciones permite abrir la traza de código del error (`Stacktrace`) en un modal grande o clicar en "Marcar como resuelto" para mitigar visualmente la alerta en el prototipo.

---

## 4. Inventario de Componentes de UI Reutilizables
* **Sidebar Navigation Link:** Item de menú interactivo con estados activos/inactivos coordinados.
* **Metric Card:** Contenedor numérico de alto impacto visual con variaciones de color de acento.
* **Action Dropdown (Button ⋮):** Menú flotante contextual idéntico para listas y tablas.
* **Status Badge:** Pastillas de color para categorización semántica (`Success`, `Warning`, `Danger`, `Info`).
* **Modal Overlay:** Estructura modular estándar con backdrop translúcido, cabecera de título, cuerpo dinámico y controles de cierre.
* **Expandible Container:** Bloque con altura animada para revelar metadatos ocultos de manera fluida.

---

## 5. Criterios de Aceptación (Condiciones Verificables)
1.  **Interactividad del Modo Oscuro:** Al alternar el Switch superior, toda la superficie visual debe cambiar de tonalidad instantáneamente sin romper los contrastes de lectura en las tablas o formularios.
2.  **Aislamiento de Dropdowns (⋮):** Al hacer clic en el botón de acciones de una fila específica, *únicamente* debe desplegarse el menú de esa fila. Si se hace clic fuera del menú o se abre otro, el anterior debe cerrarse automáticamente.
3.  **Comportamiento de Modales:** Todos los modales planteados en la especificación deben activarse con su respectiva opción del dropdown, bloquear la interacción de la capa trasera y cerrarse limpiamente tanto al presionar el botón de salida como al clicar en la zona externa gris (backdrop).
4.  **Transición de Contenedores Colapsables:** La lista de skills en la sección de agentes debe expandirse y contraerse de manera fluida mediante CSS sin saltos abruptos en la disposición del diseño de la tabla.
