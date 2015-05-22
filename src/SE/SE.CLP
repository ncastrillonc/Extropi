;									
; *********************** Sistema experto EXTROPI ****************************				
;														
; *********************** Fecha : 15 de Mayo - 2015 **************************								
;														
; ******************************** Por : *************************************									
;														
; *********************** Nataly Castrillón Charari **************************									
;								
; ************************ Camilo Taborda Zuluaga ****************************									
;								
; *********************** Juan David Zapata Sánchez **************************	
;

; Variables Globales

; Plantilla del perfil

(deftemplate persona
	(slot sexo
		(type STRING)
		(default "M")
	)
	(slot edad
		(type INTEGER)
		(default 0)
	)
	(slot embarazada
		(type STRING)
		(default "NO")
	)
	(slot dist_zona_endemica
		(type INTEGER)
		(default 0)
	)
	(slot viaje_reciente
		(type STRING)
		(default "NO")
	)
	(slot dias_desde_el_viaje
		(type INTEGER)
		(default 60)
	)
	(slot estado_salud
		(type INTEGER)
		(default 0)
	)
	(slot bandera
		(type INTEGER)
		(default 0)
	)
)


; Plantilla de síntomas

(deftemplate sintoma
	(slot malestar_general
		(type STRING)
		(default "NO")
	)
	(slot dias_malestar
		(type STRING)
		(default "NO")
	)
;
	(slot fiebre
		(type STRING)
		(default "NO")
	)
	(slot t_maxima
		(type INTEGER)
		(default 0)
	)
;	
	(slot t_descenso
		(type STRING)
		(default "NO")
	)
	(slot t_minima
		(type INTEGER)
		(default 0)
	)
;	
	(slot dolor_muscular
		(type STRING)
		(default "NO")
	)
	(slot dias_dolor_muscular
		(type STRING)
		(default "NO")
	)
;	
	(slot dolor_articular
		(type STRING)
		(default "NO")
	)
	(slot dias_dolor_articular
		(type STRING)
		(default "NO")
	)
;	
	(slot dolor_ocular
		(type STRING)
		(default "NO")
	)
	(slot dias_dolor_ocular
		(type STRING)
		(default "NO")
	)
;	
	(slot nauseas
		(type STRING)
		(default "NO")
	)
;
	(slot vomito
		(type STRING)
		(default "NO")
	)
	(slot vomito_s
		(type STRING)
		(default "NO")
	)
;	
	(slot diarrea
		(type STRING)
		(default "NO")
	)
;	
	(slot escalofrio
		(type STRING)
		(default "NO")
	)
;	
	(slot cefalea
		(type STRING)
		(default "NO")
	)
	(slot dias_cefalea
		(type STRING)
		(default "NO")
	)
;
	(slot sangrado_nasal
		(type STRING)
		(default "NO")
	)
;		
	(slot dificultad_respiratoria
		(type STRING)
		(default "NO")
	)
;
	(slot erupciones_cutaneas_extcara
		(type STRING)
		(default "NO")
	)
	(slot erupciones_cutaneas_general
		(type STRING)
		(default "NO")
	)
	(slot tipo_erupciones
		(type STRING)
		(default "NO")
	)
;
        (slot perdida_apetito
		(type STRING)
		(default "NO")
	)
        (slot icteria
		(type STRING)
		(default "NO")
	)
        (slot dif_tragar
		(type STRING)
		(default "NO")
	)
        (slot ulceras_boca
		(type STRING)
		(default "NO")
	)
        (slot piel_gris
		(type STRING)
		(default "NO")
	)
        (slot perdida_peso
		(type STRING)
		(default "NO")
	)
;
	(slot bandera
		(type INTEGER)
		(default 0)
	)
)

; Plantilla de auxiliares

(deftemplate metarule_perfil
	(slot valor
		(type INTEGER)
		(default -1)
	)
)

(deftemplate metarule_sint
	(slot valor
		(type INTEGER)
		(default -1)
	)
)

(deftemplate activar
	(slot valor
		(type INTEGER)
                (default 0)
	)
)

(deftemplate auxiliares 
	(slot aux1
		(type INTEGER)
	)
	(slot aux2
		(type INTEGER)
	)
)


; Inicializacion de las plantillas

(deffacts Hechos
	(metarule_perfil
		(valor 0)
	)
	(persona)
        (sintoma)   
        (activar)
)

; *********************************************************************************"
; * 										  *" 
; *                            MODULO EXPLICATIVO                                 *"
; * 										  *" 
; *********************************************************************************"  

; Algunas de las preguntas cuentan con su explicacion de modo que al ser requerida se 
; llama a una de estas funciones segun sea el caso.

(deffunction f_endemica()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Una zona endémica está compuesta de diversos factores, entre ellos se     |" crlf)
    (printout t "| encuentran: vivir en una zona a menos de 2200 msnm (es decir, una zona de |" crlf)
    (printout t "| temperatura caliente a templada), encontrarse cerca a bosques, vivir en   |" crlf)
    (printout t "| lugares donde se hayan presentado casos  confirmados de las enfermedades  |" crlf)
    (printout t "| como malaria, dengue, leishmaniasis, chikungunya, entre otros.            |" crlf)
    (printout t "|                                                                           |" crlf)
    (printout t "| Responda 0 si vive en una zona endémica o 10 si está en una región muy    |" crlf)
    (printout t "| lejos de la zona endémica más cercana conocida por usted.                 |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_salud()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Responda 0 si su estado es crítico, es decir, presenta altas dolencias y  |" crlf)
    (printout t "| síntomas fuera de lo común de una manera exagerada, o 10 si siente que su |" crlf)
    (printout t "| estado de salud es excelente, no presenta dolencias ni síntomas fuera de  |" crlf)
    (printout t "| lo común de ningún tipo.                                                  |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_febril()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Fiebre: La fiebre se presenta cuando la temperatura corporal se encuentra |" crlf)
    (printout t "| por encima de 37° C o 100° F                                              |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_tbaja()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Una temperatura más baja de la normal se presenta cuando la temperatura   |" crlf)
    (printout t "| corporal se encuentra por debajo de 36°C o 97°F                           |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_respira()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Se presenta dificultad respiratoria si se tiene respiración difícil,      |" crlf)
    (printout t "| incómoda o si se siente como si no estuviera recibiendo suficiente aire.  |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_cara()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Presenta erupciones en cara o extremidades como brazos, piernas.          |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_cuerpo()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Presenta erupciones distribuidas en todo el cuerpo en general.            |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_tipoe()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Responda a) si las erupciones son ulcerosas, es decir, similares a llagas |" crlf)
    (printout t "| y de tamaño considerable Responda b) si las erupciones son similares al   |" crlf)
    (printout t "| salpullido, como si fueran similares a varicela o si son pequeños bultos. |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_muscular()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| El dolor muscular se presenta como debilidad o cansancio generalizado en  |" crlf)
    (printout t "| músculos grandes o en zonas del cuerpo completas. Por ejemplo, la espalda |" crlf)
    (printout t "| o la zona abdominal.                                                      |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
) 

(deffunction f_articular()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| El dolor articular se presenta como un dolor en zonas donde se juntan     |" crlf)
    (printout t "| huesos, como lo pueden ser los tobillos, rodillas, dedos, codos, entre    |" crlf)
    (printout t "| otros.                                                                    |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

(deffunction f_tragar()
    (printout t "+---------------------------------------------------------------------------+" crlf)
    (printout t "| Dificultad para digerir los alimentos, dificultad para tragar o disfagia, |" crlf)
    (printout t "| puede generar complicaciones o dolor al tragar, haciendo que comer sea    |" crlf)
    (printout t "| más difícil.                                                              |" crlf)
    (printout t "+---------------------------------------------------------------------------+" crlf crlf)
)

; *********************************************************************************"
; * 										  *" 
; *                                  FIN                                          *"
; * 										  *" 
; *********************************************************************************" 

; Funcion que me controla la terminacion del sistema experto en un momento determinado

(deffunction finalizar_se() 
	
	(printout t "   ¿Qué desea realizar ? :" crlf)  
        (printout t "         a. Reiniciar" crlf)
        (printout t "         b. Salir del ESTROPI" crlf)
	(bind ?op (lowcase (read)))
	
	(if (or (eq (str-compare ?op "a") 0) (eq (str-compare ?op "b") 0)) then
		(if (eq (str-compare ?op "a") 0) then 
			(reset)
			(run)
		)
	else
		(while (and (neq (str-compare ?op "a") 0) (neq (str-compare ?op "b") 0)) 
			
			(printout t " " crlf)  
			(printout t "   ¿Qué desea realizar ? :" crlf)  
        		(printout t "         a. Reiniciar" crlf)
        		(printout t "         b. Salir del ESTROPI" crlf)
			(bind ?op (lowcase (read)))
	
			(if (or (eq (str-compare ?op "a") 0) (eq (str-compare ?op "b") 0)) then
				(if (eq (str-compare ?op "a") 0) then 
					(reset)
					(run)
				)
			)
		)
	)
)

; *********************************************************************************"
; * 										  *" 
; *                              REGLA INICIAL                                    *"
; * 										  *" 
; *********************************************************************************" 

(defrule saludo
	(declare (salience 999))
	(metarule_perfil (valor 0))
=>

	(printout t " " crlf)
	(printout t "************************************************************************************" crlf crlf)
	(printout t "*                        EN ESTE MOMENTO SE REGISTRARA SU PERFIL                   *" crlf crlf)
	(printout t "************************************************************************************" crlf crlf)
		
	(printout t "Desea continuar en el sistema experto ESTROPI y registrar su perfil? (s/n): ")
	(bind ?opcion0 (lowcase (read)))
	
	(if (or (eq (str-compare ?opcion0 "s") 0) (eq (str-compare ?opcion0 "n") 0)) then
		(if (eq (str-compare ?opcion0 "n") 0) then
			(printout t " " crlf)  
                	(printout t "Gracias por entrar al sistema experto ESTROPI, vuelva pronto" crlf crlf)
                	(finalizar_se)
		else
			(assert (metarule_perfil (valor 1)))
			(printout t " " crlf crlf)  
        	)
	else
		(while (and (neq (str-compare ?opcion0 "s") 0) (neq (str-compare ?opcion0 "n") 0)) 
	
			(printout t " " crlf)
			(printout t "Desea continuar en el sistema experto ESTROPI y registrar su perfil? (s/n): ")
			(bind ?opcion0 (lowcase (read)))
	
			(if (or (eq (str-compare ?opcion0 "s") 0) (eq (str-compare ?opcion0 "n") 0)) then
				(if (eq (str-compare ?opcion0 "n") 0) then
					(printout t " " crlf)  
                			(printout t "Gracias por entrar al sistema experto ESTROPI, vuelva pronto" crlf crlf)
                			(finalizar_se)
				else
					(assert (metarule_perfil (valor 1)))
					(printout t " " crlf crlf)  
				)
        		)
		)
	)
)

; *********************************************************************************"
; * 										  *" 
; *                                 PERFIL                                        *"
; * 										  *" 
; *********************************************************************************" 

(defrule pregunta1 
	(declare (salience 998))
	(metarule_perfil (valor 1))
	?p <- (persona (sexo ?s) (bandera 0))
	=>
	(printout t "***********************************************************************************+" crlf crlf)
	(printout t "*                                        PERFIL                                   * " crlf crlf)
	(printout t "***********************************************************************************+" crlf crlf)
	
	; SEXO
	
	(printout t "- ¿Cuál es su sexo?" crlf)
	(printout t "a. Femenino" crlf)
	(printout t "b. Masculino" crlf)
	(bind ?opcion1 (lowcase (read)))
	
	(if (or (eq (str-compare ?opcion1 "a") 0) (eq (str-compare ?opcion1 "b") 0)) then
		(if (eq (str-compare ?opcion1 "a") 0) then
			(modify ?p (sexo "F") (bandera 1))
		else
			(modify ?p (bandera 1))
		)
	else
		(while (and (neq (str-compare ?opcion1 "a") 0) (neq (str-compare ?opcion1 "b") 0)) 
			(printout t " " crlf)
			(printout t "- ¿Cuál es su sexo?" crlf)
			(printout t "a. Femenino" crlf)
			(printout t "b. Masculino" crlf)
			(bind ?opcion1 (lowcase (read)))
			
			(if (eq (str-compare ?opcion1 "a") 0) then
				(modify ?p (sexo "F") (bandera 1))
			else
				(modify ?p (bandera 1))
			)
		)
	)
)

(defrule pregunta2 
	(declare (salience 997))
	(metarule_perfil (valor 1))
	?p <- (persona (edad ?e) (bandera 1))
	=>
	
	(printout t " " crlf)

	(printout t "- ¿Cuántos años tiene?" crlf)
	(bind ?opcion2 (read))
	
	(if (and (>= ?opcion2 0) (<= ?opcion2 120)) then
		(modify ?p (edad ?opcion2) (bandera 2))
	else
		(while (or (< ?opcion2 0) (> ?opcion2 120)) 
			(printout t " " crlf)

			(printout t "¿Cuál es su edad?" crlf)
			(bind ?opcion2 (read))
			
			(if (and (>= ?opcion2 0) (<= ?opcion2 120)) then
				(modify ?p (edad ?opcion2) (bandera 2))
			)
		)
	)
)

(defrule pregunta3 
	(declare (salience 996))
	(metarule_perfil (valor 1))
	?p <- (persona (sexo ?s & : (eq (str-compare ?s "F") 0)) (edad ?e & : (and (>= ?e 12) (<= ?e 55))) (bandera 2))
	=>
	(assert (metarule_perfil (valor 2)))
	(modify ?p (bandera 3))
)

(defrule pregunta4 
	(declare (salience 995))
	?m <- (metarule_perfil (valor 2))
	?p <- (persona (sexo ?s & : (eq (str-compare ?s "F") 0)) (edad ?e & : (> ?e 10)) (embarazada ?em) (bandera 3))
	=>
	
	(printout t " " crlf)
	(printout t "- ¿Se encuentra embarazada actualmente?" crlf)
	(printout t "a. Si" crlf)
	(printout t "b. No" crlf)
	(bind ?opcion3 (lowcase (read)))

	(if (or (eq (str-compare ?opcion3 "a") 0) (eq (str-compare ?opcion3 "b") 0)) then
			
		(if (eq (str-compare ?opcion3 "a") 0) then
			(modify ?p (embarazada "SI"))
			(retract ?m)
		else
			(retract ?m)
		)	
	else
		(while (and (neq (str-compare ?opcion3 "a") 0) (neq (str-compare ?opcion3 "b") 0)) 
			(printout t " " crlf)
			(printout t "- ¿Se encuentra embarazada actualmente?" crlf)
			(printout t "a. Si" crlf)
			(printout t "b. No" crlf)
			(bind ?opcion3 (lowcase (read)))
		
			(if (or (eq (str-compare ?opcion3 "a") 0) (eq (str-compare ?opcion3 "b") 0)) then
				(if (eq (str-compare ?opcion3 "a") 0) then
					(modify ?p (embarazada "SI"))
					(retract ?m)
				else
					(retract ?m)
				)
			)
		)
	)
)

(defrule pregunta5 
	(declare (salience 994))
	(metarule_perfil (valor 1))
	?p <- (persona (dist_zona_endemica ?ze) (bandera ?b & : (<= ?b 3)))
	=>
	
	(printout t " " crlf)
    
        (f_endemica)

	(printout t "- De 0 a 10 indique a qué distancia se encuentra de una zona endémica" crlf)
	(bind ?opcion4 (read))

	(if (and (>= ?opcion4 0) (<= ?opcion4 10)) then
		(modify ?p (dist_zona_endemica ?opcion4) (bandera 4))		
	else
		(while (or (< ?opcion4 0) (> ?opcion4 10)) 
			(printout t " " crlf)
			(printout t "- De 0 a 10 indique a qué distancia se encuentra de una zona endémica" crlf)
			(bind ?opcion4 (read))
			
			(if (and (>= ?opcion4 0) (<= ?opcion4 10)) then
				(modify ?p (dist_zona_endemica ?opcion4) (bandera 4))
			)
		)
	)
)

(defrule pregunta6 
	(declare (salience 993))
	(metarule_perfil (valor 1))
	?p <- (persona (viaje_reciente ?vr) (bandera 4))
	=>
	
	(printout t " " crlf)
	(printout t "- ¿Ha viajado recientemente a una zona endémica?" crlf)
	(printout t "a. Si" crlf)
	(printout t "b. No" crlf)
	(bind ?opcion5 (lowcase (read)))

	(if (or (eq (str-compare ?opcion5 "a") 0) (eq (str-compare ?opcion5 "b") 0)) then
			
		(if (eq (str-compare ?opcion5 "a") 0) then
			(modify ?p (viaje_reciente "SI") (bandera 5))
			(assert (metarule_perfil (valor 3)))
		else
			(modify ?p (bandera 5))
		)		
	else
		(while (and (neq (str-compare ?opcion5 "a") 0) (neq (str-compare ?opcion5 "b") 0)) 
			(printout t " " crlf)
			(printout t "- ¿Ha viajado recientemente a una zona endémica?" crlf)
			(printout t "a. Si" crlf)
			(printout t "b. No" crlf)
			(bind ?opcion5 (lowcase (read)))
			
			(if (or (eq (str-compare ?opcion5 "a") 0) (eq (str-compare ?opcion5 "b") 0)) then
				(if (eq (str-compare ?opcion5 "a") 0) then
					(modify ?p (viaje_reciente "SI") (bandera 5))
					(assert (metarule_perfil (valor 3)))
				else
					(modify ?p (bandera 5))
				)
			)
		)
	)
)

(defrule pregunta7 
	(declare (salience 992))
	?m <- (metarule_perfil (valor 3))
	?p <- (persona (viaje_reciente ?vr & : (eq (str-compare ?vr "SI") 0)) (dias_desde_el_viaje ?dias) (bandera 5))
	=>
	
	(printout t " " crlf)
	(printout t "- ¿Hace cuántos días estuvo en la zona?" crlf)
	(bind ?opcion6 (read))

	(if (>= ?opcion6 0) then
		(if (> ?opcion6 60) then
			(modify ?p (dias_desde_el_viaje 60))
			(retract ?m)
		else
			(modify ?p (dias_desde_el_viaje ?opcion6))
			(retract ?m)
		)
	else
		(while (< ?opcion6 0) 
			(printout t " " crlf)
			(printout t "- ¿Hace cuántos días estuvo en la zona?" crlf)
			(bind ?opcion6 (read))
			
			(if (> ?opcion6 60) then
				(modify ?p (dias_desde_el_viaje 60))
				(retract ?m)
			else
				(modify ?p (dias_desde_el_viaje ?opcion6))
				(retract ?m)
			)
		)
	)
)

(defrule pregunta8 
	(declare (salience 991))
	(metarule_perfil (valor 1))
	?p <- (persona (estado_salud ?eu) (bandera 5))
	=>
	
	(printout t " " crlf)
    
        (f_salud)

	(printout t "- De 0 a 10 indique cómo considera su estado de salud actual" crlf)
	(bind ?opcion7 (read))

	(if (and (>= ?opcion7 0) (<= ?opcion7 10)) then
		(modify ?p (estado_salud ?opcion7) (bandera 6))		
	else
		(while (or (< ?opcion7 0) (> ?opcion7 10)) 
			(printout t " " crlf)
			(printout t "- De 0 a 10 indique a qué distancia se encuentra de una zona endémica" crlf)
			(bind ?opcion7 (read))
			
			(if (and (>= ?opcion7 0) (<= ?opcion7 10)) then
				(modify ?p (estado_salud ?opcion7) (bandera 6))
			)
		)
	)
)

; *********************************************************************************"
; * 										  *" 
; *                                MODULO DE LD                                   *"
; * 										  *" 
; *********************************************************************************" 

(defrule modulo_ld 
	(declare (salience 990))
	?p <- (persona (sexo ?s) (edad ?e) (embarazada ?em) (dist_zona_endemica ?ze) (viaje_reciente ?vr) 
		       (dias_desde_el_viaje ?dias) (estado_salud ?eu) (bandera 6))
	=>
	(store age ?e)	
	(store pregnant ?em)
	(store zone ?ze)	
	(store days ?dias)
	(store st ?eu)

	(modify ?p (bandera 7))
) 

(defrule eval 
    (declare (salience 889)) 
    ?a <- (auxiliares (aux1 ?valor) (aux2 1)) 
    ?p <- (persona (embarazada ?e) (bandera 7)) 
    => 
    (printout t " " crlf)
    (printout t "La probabilidad de que usted tenga una enfermedad tropical es del " ?valor " %" crlf crlf)

    (if (>= ?valor 60) then
        (printout t "Se le recomienda ejecutar el SE. Desea hacerlo? (s/n)" crlf)
    else
        (if (and (>= ?valor 45) (eq (str-compare ?e "SI") 0)) then
            (printout t "Sin embargo, dado su embarazo se le recomienda ejecutar el SE. Desea hacerlo? (s/n)" crlf)
        else
            (printout t "No necesita ejecutar el SE. Desea ejecutarlo? (s/n)" crlf)
        )
    )

    (bind ?opt1 (lowcase (read)))

    (if (or (eq (str-compare ?opt1 "s") 0) (eq (str-compare ?opt1 "n") 0)) then

        (if (eq (str-compare ?opt1 "s") 0) then
            (modify ?p (bandera 8))
            (modify ?a (aux2 2))
            (assert (metarule_sint (valor 0)))
        else
            (printout t " " crlf)  
            (printout t "Gracias por entrar al sistema experto ESTROPI, vuelva pronto" crlf crlf)
            (finalizar_se)
            (modify ?a (aux2 2))
        )		
    else
        (while (and (neq (str-compare ?opt1 "s") 0) (neq (str-compare ?opt1 "n") 0)) 
            (printout t " " crlf)
            (printout t "¿Desea ejecutar el SE? (s/n)" crlf)
            (bind ?opt1 (lowcase (read)))

            (if (or (eq (str-compare ?opt1 "s") 0) (eq (str-compare ?opt1 "n") 0)) then

                (if (eq (str-compare ?opt1 "s") 0) then
                    (modify ?p (bandera 8))
                    (modify ?a (aux2 2))
                    (assert (metarule_sint (valor 0)))
                else
                    (printout t " " crlf)  
                    (printout t "Gracias por entrar al sistema experto ESTROPI, vuelva pronto" crlf crlf)
                    (finalizar_se)
                    (modify ?a (aux2 2))
                )		
            )
        )
    )        
)

; *********************************************************************************"
; * 										  *" 
; *                              SINTOMATOLOGIA                                   *"
; * 										  *" 
; *********************************************************************************" 

(defrule question1 
    (declare (salience 800)) 
    ?m <- (metarule_sint (valor 0))
    ?s <- (sintoma (malestar_general ?mg))
    => 
    (printout t " " crlf)
    (printout t "************************************************************************************" crlf crlf)
    (printout t "*                    EN ESTE MOMENTO SE REGISTRARA SU SINTOMATOLOGÍA               *" crlf crlf)
    (printout t "************************************************************************************" crlf crlf)

    (printout t " " crlf)
    (printout t "- ¿Experimenta fatiga o sensación de no tener energía suficiente para realizar sus actividades habituales?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)
    (bind ?q1 (lowcase (read)))

    (if (or (eq (str-compare ?q1 "a") 0) (eq (str-compare ?q1 "b") 0)) then

        (if (eq (str-compare ?q1 "a") 0) then
            (assert (metarule_sint (valor 1)))
            (modify ?s (malestar_general "SI"))
        else
            (assert (metarule_sint (valor 2)))
        )
    else
        (while (and (neq (str-compare ?q1 "a") 0) (neq (str-compare ?q1 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta fatiga o sensación de no tener energía suficiente para realizar sus actividades habituales?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)
            (bind ?q1 (lowcase (read)))

            (if (or (eq (str-compare ?q1 "a") 0) (eq (str-compare ?q1 "b") 0)) then
                (if (eq (str-compare ?q1 "a") 0) then
                    (assert (metarule_sint (valor 1)))
                    (modify ?s (malestar_general "SI"))
                else
                    (assert (metarule_sint (valor 2)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question2
    ?m <- (metarule_sint (valor 1))
    ?s <- (sintoma (dias_malestar ?dm))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. Una semana o menos" crlf)
    (printout t "b. De 2 a 3 semanas" crlf)
    (printout t "c. Aproximadamente 1 mes" crlf)
    (printout t "d. Más de un mes" crlf)

    (bind ?q2 (lowcase (read)))

    (if (or (eq (str-compare ?q2 "a") 0) (eq (str-compare ?q2 "b") 0) 
        (eq (str-compare ?q2 "c") 0) (eq (str-compare ?q2 "d") 0)) then

        (if (eq (str-compare ?q2 "a") 0) then
            (modify ?s (dias_malestar "RANGO 1"))
        else
            (if (eq (str-compare ?q2 "b") 0) then
                (modify ?s (dias_malestar "RANGO 2"))
            else
                (if (eq (str-compare ?q2 "c") 0) then
                    (modify ?s (dias_malestar "RANGO 3"))
                else
                    (modify ?s (dias_malestar "RANGO 4"))
                )
            )
        )
    else
        (while (and (neq (str-compare ?q2 "a") 0) (neq (str-compare ?q2 "b") 0) 
                    (neq (str-compare ?q2 "c") 0) (neq (str-compare ?q2 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. Una semana o menos" crlf)
            (printout t "b. De 2 a 3 semanas" crlf)
            (printout t "c. Aproximadamente 1 mes" crlf)
            (printout t "d. Más de un mes" crlf)

            (bind ?q2 (lowcase (read)))

            (if (or (eq (str-compare ?q2 "a") 0) (eq (str-compare ?q2 "b") 0) 
                    (eq (str-compare ?q2 "c") 0) (eq (str-compare ?q2 "d") 0)) then

                (if (eq (str-compare ?q2 "a") 0) then
                    (modify ?s (dias_malestar "RANGO 1"))
                else
                    (if (eq (str-compare ?q2 "b") 0) then
                        (modify ?s (dias_malestar "RANGO 2"))
                    else
                        (if (eq (str-compare ?q2 "c") 0) then
                            (modify ?s (dias_malestar "RANGO 3"))
                        else
                            (modify ?s (dias_malestar "RANGO 4"))                            
                        )
                    )
                )
            )
        )
    )
    (retract ?m)
    (assert (metarule_sint (valor 11)))
)

(defrule question3
    ?m <- (metarule_sint (valor 11))
    ?s <- (sintoma (fiebre ?f))
    => 
    (printout t " " crlf)
    
    (f_febril)
    
    (printout t "- ¿Ha experimentado episodios febriles?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q3 (lowcase (read)))

    (if (or (eq (str-compare ?q3 "a") 0) (eq (str-compare ?q3 "b") 0)) then

        (if (eq (str-compare ?q3 "a") 0) then
            (modify ?s (fiebre "SI"))
            (assert (metarule_sint (valor 111)))
        else
            (assert (metarule_sint (valor 112)))
        )
    else
        (while (and (neq (str-compare ?q3 "a") 0) (neq (str-compare ?q3 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado episodios febriles?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q3 (lowcase (read)))

            (if (or (eq (str-compare ?q3 "a") 0) (eq (str-compare ?q3 "b") 0)) then

                (if (eq (str-compare ?q3 "a") 0) then
                    (modify ?s (fiebre "SI"))
                    (assert (metarule_sint (valor 111)))
                else
                    (assert (metarule_sint (valor 112)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question4
    ?m <- (metarule_sint (valor 111))
    ?s <- (sintoma (t_maxima ?f))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cúal ha sido la temperatura máxima alcanzada? (En grandos centígrados)" crlf)
    (bind ?q4 (read))

    (if (>= ?q4 0) then
        (modify ?s (t_maxima ?q4))
    else
        (while (< ?q4 0) 
            (printout t " " crlf)
            (printout t "- ¿Cúal ha sido la temperatura máxima alcanzada? (En Grados Centígrados)" crlf)
            (bind ?q4 (read))

            (if (>= ?q4 0) then
                (modify ?s (t_maxima ?q4))
            )
        )
    )
    (retract ?m)
    (assert (metarule_sint (valor 1111)))    
)

(defrule question5
    ?m <- (metarule_sint (valor 1111))
    ?s <- (sintoma (dolor_muscular ?dm))
    => 
    (printout t " " crlf)

    (f_muscular)

    (printout t "- ¿Ha experimentado dolor muscular?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q5 (lowcase (read)))

    (if (or (eq (str-compare ?q5 "a") 0) (eq (str-compare ?q5 "b") 0)) then

        (if (eq (str-compare ?q5 "a") 0) then
            (modify ?s (dolor_muscular "SI"))
            (assert (metarule_sint (valor 11111)))
        else
            (assert (metarule_sint (valor 11112)))
        )
    else
        (while (and (neq (str-compare ?q5 "a") 0) (neq (str-compare ?q5 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado dolor muscular?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q5 (lowcase (read)))

            (if (or (eq (str-compare ?q5 "a") 0) (eq (str-compare ?q5 "b") 0)) then

                (if (eq (str-compare ?q5 "a") 0) then
                    (modify ?s (dolor_muscular "SI"))
                    (assert (metarule_sint (valor 11111)))
                else
                    (assert (metarule_sint (valor 11112)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question6
    ?m <- (metarule_sint (valor 11111))
    ?s <- (sintoma (dias_dolor_muscular ?dd))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. Una semana o menos" crlf)
    (printout t "b. De 2 a 3 semanas" crlf)
    (printout t "c. Aproximadamente 1 mes" crlf)
    (printout t "d. Más de un mes" crlf)

    (bind ?q6 (lowcase (read)))

    (if (or (eq (str-compare ?q6 "a") 0) (eq (str-compare ?q6 "b") 0) 
        (eq (str-compare ?q6 "c") 0) (eq (str-compare ?q6 "d") 0)) then

        (if (eq (str-compare ?q6 "a") 0) then
            (modify ?s (dias_dolor_muscular "RANGO 1"))
        else
            (if (eq (str-compare ?q6 "b") 0) then
                (modify ?s (dias_dolor_muscular "RANGO 2"))
            else
                (if (eq (str-compare ?q6 "c") 0) then
                    (modify ?s (dias_dolor_muscular "RANGO 3"))
                else
                    (modify ?s (dias_dolor_muscular "RANGO 4"))
                )
            )
        )
    else
        (while (and (neq (str-compare ?q6 "a") 0) (neq (str-compare ?q6 "b") 0) 
                    (neq (str-compare ?q6 "c") 0) (neq (str-compare ?q6 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. Una semana o menos" crlf)
            (printout t "b. De 2 a 3 semanas" crlf)
            (printout t "c. Aproximadamente 1 mes" crlf)
            (printout t "d. Más de un mes" crlf)

            (bind ?q6 (lowcase (read)))

            (if (or (eq (str-compare ?q6 "a") 0) (eq (str-compare ?q6 "b") 0) 
                    (eq (str-compare ?q6 "c") 0) (eq (str-compare ?q6 "d") 0)) then

                (if (eq (str-compare ?q6 "a") 0) then
                    (modify ?s (dias_dolor_muscular "RANGO 1"))
                else
                    (if (eq (str-compare ?q6 "b") 0) then
                        (modify ?s (dias_dolor_muscular "RANGO 2"))
                    else
                        (if (eq (str-compare ?q6 "c") 0) then
                            (modify ?s (dias_dolor_muscular "RANGO 3"))
                        else
                            (modify ?s (dias_dolor_muscular "RANGO 4"))                            
                        )
                    )
                )
            )
        )
    )
    (retract ?m)
    (assert (metarule_sint (valor 111111)))
)

(defrule question7
    ?m <- (metarule_sint (valor 111111))
    ?s <- (sintoma (dolor_ocular ?do))
    => 
    (printout t " " crlf)
    (printout t "- ¿Experimenta dolor en sus ojos al realizar movimientos con ellos?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q6 (lowcase (read)))

    (if (or (eq (str-compare ?q6 "a") 0) (eq (str-compare ?q6 "b") 0)) then

        (if (eq (str-compare ?q6 "a") 0) then
            (modify ?s (dolor_ocular "SI"))
            (assert (metarule_sint (valor 1111111)))
        else
            (assert (metarule_sint (valor 20)))
        )
    else
        (while (and (neq (str-compare ?q6 "a") 0) (neq (str-compare ?q6 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta dolor en sus ojos al realizar movimientos con ellos?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q6 (lowcase (read)))

            (if (or (eq (str-compare ?q6 "a") 0) (eq (str-compare ?q6 "b") 0)) then

                (if (eq (str-compare ?q6 "a") 0) then
                    (modify ?s (dolor_ocular "SI"))
                    (assert (metarule_sint (valor 1111111)))
                else
                    (assert (metarule_sint (valor 20)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question8
    ?m <- (metarule_sint (valor 1111111))
    ?s <- (sintoma (dias_dolor_ocular ?dd))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. Una semana o menos" crlf)
    (printout t "b. De 2 a 3 semanas" crlf)
    (printout t "c. Aproximadamente 1 mes" crlf)
    (printout t "d. Más de un mes" crlf)

    (bind ?q8 (lowcase (read)))

    (if (or (eq (str-compare ?q8 "a") 0) (eq (str-compare ?q8 "b") 0) 
        (eq (str-compare ?q8 "c") 0) (eq (str-compare ?q8 "d") 0)) then

        (if (eq (str-compare ?q8 "a") 0) then
            (modify ?s (dias_dolor_ocular "RANGO 1"))
        else
            (if (eq (str-compare ?q8 "b") 0) then
                (modify ?s (dias_dolor_ocular "RANGO 2"))
            else
                (if (eq (str-compare ?q8 "c") 0) then
                    (modify ?s (dias_dolor_ocular "RANGO 3"))
                else
                    (modify ?s (dias_dolor_ocular "RANGO 4"))
                )
            )
        )
    else
        (while (and (neq (str-compare ?q8 "a") 0) (neq (str-compare ?q8 "b") 0) 
                    (neq (str-compare ?q8 "c") 0) (neq (str-compare ?q8 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. Una semana o menos" crlf)
            (printout t "b. De 2 a 3 semanas" crlf)
            (printout t "c. Aproximadamente 1 mes" crlf)
            (printout t "d. Más de un mes" crlf)

            (bind ?q8 (lowcase (read)))

            (if (or (eq (str-compare ?q8 "a") 0) (eq (str-compare ?q8 "b") 0) 
                    (eq (str-compare ?q8 "c") 0) (eq (str-compare ?q8 "d") 0)) then

                (if (eq (str-compare ?q8 "a") 0) then
                    (modify ?s (dias_dolor_ocular "RANGO 1"))
                else
                    (if (eq (str-compare ?q8 "b") 0) then
                        (modify ?s (dias_dolor_ocular "RANGO 2"))
                    else
                        (if (eq (str-compare ?q8 "c") 0) then
                            (modify ?s (dias_dolor_ocular "RANGO 3"))
                        else
                            (modify ?s (dias_dolor_ocular "RANGO 4"))                            
                        )
                    )
                )
            )
        )
    )
    (retract ?m)
    (assert (metarule_sint (valor 10)))
)

(defrule question9
    ?m <- (metarule_sint (valor 2))
    ?s <- (sintoma (nauseas ?n))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado nauseas?" crlf)
    (printout t "a. Sí, de forma frecuente" crlf)
    (printout t "b. Sí, ocasionalmente" crlf)
    (printout t "c. No" crlf)

    (bind ?q9 (lowcase (read)))

    (if (or (eq (str-compare ?q9 "a") 0) (eq (str-compare ?q9 "b") 0) 
            (eq (str-compare ?q9 "c") 0)) then

        (if (eq (str-compare ?q9 "c") 0) then
            (assert (metarule_sint (valor 100)))
        else
            (if (eq (str-compare ?q9 "b") 0) then
                (modify ?s (nauseas "OCASIONALMENTE"))                
            else
                (modify ?s (nauseas "FRECUENTEMENTE"))
            )
            (assert (metarule_sint (valor 21)))
        )
    else
        (while (and (neq (str-compare ?q9 "a") 0) (neq (str-compare ?q9 "b") 0) 
                    (neq (str-compare ?q9 "c") 0)) 
            (printout t "- ¿Ha experimentado nauseas?" crlf)
            (printout t "a. Sí, de forma frecuente" crlf)
            (printout t "b. Sí, ocasionalmente" crlf)
            (printout t "c. No" crlf)

            (bind ?q9 (lowcase (read)))

            (if (or (eq (str-compare ?q9 "a") 0) (eq (str-compare ?q9 "b") 0) 
                    (eq (str-compare ?q9 "c") 0)) then

                (if (eq (str-compare ?q9 "c") 0) then
                    (assert (metarule_sint (valor 100)))
                else
                    (if (eq (str-compare ?q9 "b") 0) then
                        (modify ?s (nauseas "OCASIONALMENTE"))                
                    else
                        (modify ?s (nauseas "FRECUENTEMENTE"))
                    )
                    (assert (metarule_sint (valor 21)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question10
    ?m <- (metarule_sint (valor 21))
    ?s <- (sintoma (escalofrio ?es))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado episodios de escalofríos?" crlf)
    (printout t "a. Sí, de forma frecuente" crlf)
    (printout t "b. Sí, ocasionalmente" crlf)
    (printout t "c. No" crlf)

    (bind ?q10 (lowcase (read)))

    (if (or (eq (str-compare ?q10 "a") 0) (eq (str-compare ?q10 "b") 0) 
            (eq (str-compare ?q10 "c") 0)) then

        (if (eq (str-compare ?q10 "c") 0) then
            (assert (metarule_sint (valor 90)))
        else
            (if (eq (str-compare ?q10 "b") 0) then
                (modify ?s (escalofrio "OCASIONALMENTE"))                
            else
                (modify ?s (escalofrio "FRECUENTEMENTE"))
            )
            (assert (metarule_sint (valor 80)))
        )
    else
        (while (and (neq (str-compare ?q10 "a") 0) (neq (str-compare ?q10 "b") 0) 
                    (neq (str-compare ?q10 "c") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado episodios de escalofríos?" crlf)
            (printout t "a. Sí, de forma frecuente" crlf)
            (printout t "b. Sí, ocasionalmente" crlf)
            (printout t "c. No" crlf)

            (bind ?q10 (lowcase (read)))

            (if (or (eq (str-compare ?q10 "a") 0) (eq (str-compare ?q10 "b") 0) 
                    (eq (str-compare ?q10 "c") 0)) then

                (if (eq (str-compare ?q10 "c") 0) then
                    (assert (metarule_sint (valor 90)))
                else
                    (if (eq (str-compare ?q10 "b") 0) then
                        (modify ?s (escalofrio "OCASIONALMENTE"))                
                    else
                        (modify ?s (escalofrio "FRECUENTEMENTE"))
                    )
                    (assert (metarule_sint (valor 80)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question11
    ?m <- (metarule_sint (valor 112))
    ?s <- (sintoma (t_descenso ?td))
    => 
    (printout t " " crlf)

    (f_tbaja)
    
    (printout t "- ¿Su temperatura corporal ha estado por debajo de lo normal?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q11 (lowcase (read)))

    (if (or (eq (str-compare ?q11 "a") 0) (eq (str-compare ?q11 "b") 0)) then

        (if (eq (str-compare ?q11 "a") 0) then
            (modify ?s (t_descenso "SI"))
            (assert (metarule_sint (valor 1121)))
        else
            (assert (metarule_sint (valor 50)))
        )
    else
        (while (and (neq (str-compare ?q11 "a") 0) (neq (str-compare ?q11 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Su temperatura corporal ha estado por debajo de lo normal?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q11 (lowcase (read)))

            (if (or (eq (str-compare ?q11 "a") 0) (eq (str-compare ?q11 "b") 0)) then

                (if (eq (str-compare ?q11 "a") 0) then
                    (modify ?s (t_descenso "SI"))
                    (assert (metarule_sint (valor 1121)))
                else
                    (assert (metarule_sint (valor 50)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question12
    ?m <- (metarule_sint (valor 1121))
    ?s <- (sintoma (t_minima ?min))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cúal ha sido la temperatura mínima alcanzada? (En grandos centígrados)" crlf)
    (bind ?q12 (read))

    (if (>= ?q12 0) then
        (modify ?s (t_minima ?q12))
    else
        (while (< ?q12 0) 
            (printout t " " crlf)
            (printout t "- ¿Cúal ha sido la temperatura mínima alcanzada? (En grandos centígrados)" crlf)
            (bind ?q12 (read))

            (if (>= ?q12 0) then
                (modify ?s (t_minima ?q12))
            )
        )
    )
    (retract ?m)
    (assert (metarule_sint (valor 11211)))    
)

(defrule question13
    ?m <- (metarule_sint (valor 11211))
    ?s <- (sintoma (vomito ?v))
    => 
    (printout t " " crlf)
    (printout t "- ¿Experimenta episodios de vómito?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q13 (lowcase (read)))

    (if (or (eq (str-compare ?q13 "a") 0) (eq (str-compare ?q13 "b") 0)) then

        (if (eq (str-compare ?q13 "a") 0) then
            (modify ?s (vomito "SI"))
            (assert (metarule_sint (valor 112111)))
        else
            (assert (metarule_sint (valor 70)))
        )
    else
        (while (and (neq (str-compare ?q13 "a") 0) (neq (str-compare ?q13 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta episodios de vómito?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q13 (lowcase (read)))

            (if (or (eq (str-compare ?q13 "a") 0) (eq (str-compare ?q13 "b") 0)) then

                (if (eq (str-compare ?q13 "a") 0) then
                    (modify ?s (vomito "SI"))
                    (assert (metarule_sint (valor 112111)))
                else
                    (assert (metarule_sint (valor 70)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question14
    ?m <- (metarule_sint (valor 112111))
    ?s <- (sintoma (vomito_s ?vs))
    => 
    (printout t " " crlf)
    (printout t "- ¿Experimenta episodios de vómito con sangre?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q14 (lowcase (read)))

    (if (or (eq (str-compare ?q14 "a") 0) (eq (str-compare ?q14 "b") 0)) then

        (if (eq (str-compare ?q14 "a") 0) then
            (modify ?s (vomito_s "SI"))
            (assert (metarule_sint (valor 60)))
        else
            (assert (metarule_sint (valor 70)))
        )
    else
        (while (and (neq (str-compare ?q14 "a") 0) (neq (str-compare ?q14 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta episodios de vómito con sangre?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q14 (lowcase (read)))

            (if (or (eq (str-compare ?q14 "a") 0) (eq (str-compare ?q14 "b") 0)) then

                (if (eq (str-compare ?q14 "a") 0) then
                    (modify ?s (vomito_s "SI"))
                    (assert (metarule_sint (valor 60)))
                else
                    (assert (metarule_sint (valor 70)))
                )
            )
        )
    )
    (retract ?m)
)

(defrule question15
    ?m <- (metarule_sint (valor 11112))
    ?s <- (sintoma (diarrea ?d))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha presentado diarrea?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q15 (lowcase (read)))

    (if (or (eq (str-compare ?q15 "a") 0) (eq (str-compare ?q15 "b") 0)) then

        (if (eq (str-compare ?q15 "a") 0) then
            (modify ?s (diarrea "SI"))
            (assert (metarule_sint (valor 30)))
        else
            (assert (metarule_sint (valor 40)))
        )
    else
        (while (and (neq (str-compare ?q15 "a") 0) (neq (str-compare ?q15 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha presentado diarrea?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q15 (lowcase (read)))

            (if (or (eq (str-compare ?q15 "a") 0) (eq (str-compare ?q15 "b") 0)) then

                (if (eq (str-compare ?q15 "a") 0) then
                    (modify ?s (diarrea "SI"))
                    (assert (metarule_sint (valor 30)))
                else
                    (assert (metarule_sint (valor 40)))
                )
            )
        )
    )
    (retract ?m)
)

; *********************************************************************************"
; * 										  *" 
; *                                ENFOQUES                                       *"
; * 										  *" 
; *********************************************************************************" 


(defrule question16
    ?a <- (activar (valor 1))
    ?s <- (sintoma (cefalea ?c) (bandera 0))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado fuertes dolores de cabeza?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q16 (lowcase (read)))

    (if (or (eq (str-compare ?q16 "a") 0) (eq (str-compare ?q16 "b") 0)) then

        (if (eq (str-compare ?q16 "a") 0) then
            (modify ?s (cefalea "SI"))
        else
            (retract ?a)
        )
    else
        (while (and (neq (str-compare ?q16 "a") 0) (neq (str-compare ?q16 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado fuertes dolores de cabeza?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q16 (lowcase (read)))

            (if (or (eq (str-compare ?q16 "a") 0) (eq (str-compare ?q16 "b") 0)) then

                (if (eq (str-compare ?q16 "a") 0) then
                    (modify ?s (cefalea "SI"))
                else
                    (retract ?a)
                )
            )
        )
    )
    (modify ?s (bandera 1))
)

(defrule question17
    ?a <- (activar (valor 1))
    ?s <- (sintoma (dias_cefalea ?dc) (bandera 1))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. De 1 a 3 días" crlf)
    (printout t "b. Aproximadamente 1 semana" crlf)
    (printout t "c. Más de una semana" crlf)

    (bind ?q17 (lowcase (read)))

    (if (or (eq (str-compare ?q17 "a") 0) (eq (str-compare ?q17 "b") 0) 
        (eq (str-compare ?q17 "c") 0)) then

        (if (eq (str-compare ?q17 "a") 0) then
            (modify ?s (dias_cefalea "RANGO 1"))
        else
            (if (eq (str-compare ?q17 "b") 0) then
                (modify ?s (dias_cefalea "RANGO 2"))
            else
                (modify ?s (dias_cefalea "RANGO 3"))
            )
        )
    else
        (while (and (neq (str-compare ?q6 "a") 0) (neq (str-compare ?q6 "b") 0) 
                    (neq (str-compare ?q6 "c") 0) (neq (str-compare ?q6 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. De 1 a 3 días" crlf)
            (printout t "b. Aproximadamente 1 semana" crlf)
            (printout t "c. Más de una semana" crlf)

            (bind ?q17 (lowcase (read)))

            (if (or (eq (str-compare ?q17 "a") 0) (eq (str-compare ?q17 "b") 0) 
                    (eq (str-compare ?q17 "c") 0)) then

                (if (eq (str-compare ?q17 "a") 0) then
                    (modify ?s (dias_cefalea "RANGO 1"))
                else
                    (if (eq (str-compare ?q17 "b") 0) then
                        (modify ?s (dias_cefalea "RANGO 2"))
                    else
                        (modify ?s (dias_cefalea "RANGO 3"))
                    )
                )
            )
        )
    )
    (retract ?a)
)

(defrule question18
    ?a <- (activar (valor 2))
    ?s <- (sintoma (erupciones_cutaneas_extcara ?ec) (bandera 3))
    => 
    (printout t " " crlf)

    (f_cara)

    (printout t "- ¿Presenta erupciones cutáneas en extremidades o cara?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q18 (lowcase (read)))

    (if (or (eq (str-compare ?q18 "a") 0) (eq (str-compare ?q18 "b") 0)) then

        (if (eq (str-compare ?q18 "a") 0) then
            (modify ?s (erupciones_cutaneas_extcara "SI") (bandera 4))
        )
    else
        (while (and (neq (str-compare ?q18 "a") 0) (neq (str-compare ?q18 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Presenta erupciones cutáneas en extremidades o cara?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q18 (lowcase (read)))

            (if (or (eq (str-compare ?q18 "a") 0) (eq (str-compare ?q18 "b") 0)) then

                (if (eq (str-compare ?q18 "a") 0) then
                    (modify ?s (erupciones_cutaneas_extcara "SI") (bandera 4))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question19
    ?a <- (activar (valor 3))
    ?s <- (sintoma (erupciones_cutaneas_general ?ec) (bandera 6))
    => 
    (printout t " " crlf)

    (f_cuerpo)

    (printout t "- ¿Presenta erupciones cutáneas de forma generalizada?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q19 (lowcase (read)))

    (if (or (eq (str-compare ?q19 "a") 0) (eq (str-compare ?q19 "b") 0)) then

        (if (eq (str-compare ?q19 "a") 0) then
            (modify ?s (erupciones_cutaneas_general "SI") (bandera 7))
        )
    else
        (while (and (neq (str-compare ?q19 "a") 0) (neq (str-compare ?q19 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Presenta erupciones cutáneas de forma generalizada?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q19 (lowcase (read)))

            (if (or (eq (str-compare ?q19 "a") 0) (eq (str-compare ?q19 "b") 0)) then

                (if (eq (str-compare ?q19 "a") 0) then
                    (modify ?s (erupciones_cutaneas_general "SI") (bandera 7))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question20
    ?a <- (activar (valor 4))
    ?s <- (sintoma (tipo_erupciones "NO") (bandera ?b & : (or (eq ?b 4) (eq ?b 7))))
    => 
    (printout t " " crlf)

    (f_tipoe)

    (printout t "- ¿Qué tipo de erupciones ha presentado?" crlf)
    (printout t "a. Ulcerosas" crlf)
    (printout t "b. Semejantes al salpullido" crlf)

    (bind ?q20 (lowcase (read)))

    (if (or (eq (str-compare ?q20 "a") 0) (eq (str-compare ?q20 "b") 0)) then

        (if (eq (str-compare ?q20 "a") 0) then
            (modify ?s (tipo_erupciones "ULCEROSAS") (bandera 66))
        else
            (modify ?s (tipo_erupciones "SALPULLIDO") (bandera 66))
        )
    else
        (while (and (neq (str-compare ?q20 "a") 0) (neq (str-compare ?q20 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Qué tipo de erupciones ha presentado?" crlf)
            (printout t "a. Ulcerosas" crlf)
            (printout t "b. Semejantes al salpullido" crlf)

            (bind ?q20 (lowcase (read)))

            (if (or (eq (str-compare ?q20 "a") 0) (eq (str-compare ?q20 "b") 0)) then

                (if (eq (str-compare ?q20 "a") 0) then
                    (modify ?s (tipo_erupciones "ULCEROSAS") (bandera 66))
                else
                    (modify ?s (tipo_erupciones "SALPULLIDO") (bandera 66))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question21
    ?a <- (activar (valor 5))
    ?s <- (sintoma (dolor_articular ?dm) (bandera 9))
    => 
    (printout t " " crlf)

    (f_articular)

    (printout t "- ¿Ha experimentado dolor articular?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q21 (lowcase (read)))

    (if (or (eq (str-compare ?q21 "a") 0) (eq (str-compare ?q21 "b") 0)) then

        (if (eq (str-compare ?q21 "a") 0) then
            (modify ?s (dolor_articular "SI") (bandera 10))
        )
    else
        (while (and (neq (str-compare ?q21 "a") 0) (neq (str-compare ?q21 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado dolor articular?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q21 (lowcase (read)))

            (if (or (eq (str-compare ?q21 "a") 0) (eq (str-compare ?q21 "b") 0)) then

                (if (eq (str-compare ?q21 "a") 0) then
                    (modify ?s (dolor_articular "SI") (bandera 10))
                )
            )
        )
    )
)

(defrule question22
    ?a <- (activar (valor 5))
    ?s <- (sintoma (dias_dolor_articular ?dd) (bandera 10))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. Una semana o menos" crlf)
    (printout t "b. De 2 a 3 semanas" crlf)
    (printout t "c. Aproximadamente 1 mes" crlf)
    (printout t "d. Más de un mes" crlf)

    (bind ?q22 (lowcase (read)))

    (if (or (eq (str-compare ?q22 "a") 0) (eq (str-compare ?q22 "b") 0) 
        (eq (str-compare ?q22 "c") 0) (eq (str-compare ?q22 "d") 0)) then

        (if (eq (str-compare ?q22 "a") 0) then
            (modify ?s (dias_dolor_articular "RANGO 1"))
        else
            (if (eq (str-compare ?q22 "b") 0) then
                (modify ?s (dias_dolor_articular "RANGO 2"))
            else
                (if (eq (str-compare ?q22 "c") 0) then
                    (modify ?s (dias_dolor_articular "RANGO 3"))
                else
                    (modify ?s (dias_dolor_articular "RANGO 4"))
                )
            )
        )
    else
        (while (and (neq (str-compare ?q22 "a") 0) (neq (str-compare ?q22 "b") 0) 
                    (neq (str-compare ?q22 "c") 0) (neq (str-compare ?q22 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. Una semana o menos" crlf)
            (printout t "b. De 2 a 3 semanas" crlf)
            (printout t "c. Aproximadamente 1 mes" crlf)
            (printout t "d. Más de un mes" crlf)

            (bind ?q22 (lowcase (read)))

            (if (or (eq (str-compare ?q22 "a") 0) (eq (str-compare ?q22 "b") 0) 
                    (eq (str-compare ?q22 "c") 0) (eq (str-compare ?q22 "d") 0)) then

                (if (eq (str-compare ?q22 "a") 0) then
                    (modify ?s (dias_dolor_articular "RANGO 1"))
                else
                    (if (eq (str-compare ?q22 "b") 0) then
                        (modify ?s (dias_dolor_articular "RANGO 2"))
                    else
                        (if (eq (str-compare ?q22 "c") 0) then
                            (modify ?s (dias_dolor_articular "RANGO 3"))
                        else
                            (modify ?s (dias_dolor_articular "RANGO 4"))
                        )
                    )
                )
            )
        )
    )
    (retract ?a)
)

(defrule question23
    ?a <- (activar (valor 6))
    ?s <- (sintoma (dificultad_respiratoria ?dr))
    => 
    (printout t " " crlf)

    (f_respira)

    (printout t "- ¿Ha presentado dificultad para respirar de forma normal?" crlf)
    (printout t "a. Sí, de forma frecuente" crlf)
    (printout t "b. Sí, ocasionalmente" crlf)
    (printout t "c. No" crlf)

    (bind ?q23 (lowcase (read)))

    (if (or (eq (str-compare ?q23 "a") 0) (eq (str-compare ?q23 "b") 0) 
            (eq (str-compare ?q23 "c") 0)) then

        (if (neq (str-compare ?q23 "c") 0) then
            (if (eq (str-compare ?q23 "b") 0) then
                (modify ?s (dificultad_respiratoria "OCASIONALMENTE"))                
            else
                (modify ?s (dificultad_respiratoria "FRECUENTEMENTE"))
            )
        )
    else
        (while (and (neq (str-compare ?q23 "a") 0) (neq (str-compare ?q23 "b") 0) 
                    (neq (str-compare ?q23 "c") 0)) 
            (printout t "- ¿Ha presentado dificultad para respirar de forma normal?" crlf)
            (printout t "a. Sí, de forma frecuente" crlf)
            (printout t "b. Sí, ocasionalmente" crlf)
            (printout t "c. No" crlf)

            (bind ?q23 (lowcase (read)))

            (if (neq (str-compare ?q23 "c") 0) then
                (if (eq (str-compare ?q23 "b") 0) then
                    (modify ?s (dificultad_respiratoria "OCASIONALMENTE"))                
                else
                    (modify ?s (dificultad_respiratoria "FRECUENTEMENTE"))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question24
    ?a <- (activar (valor 7))
    ?s <- (sintoma (fiebre ?f) (bandera 13))
    => 
    (printout t " " crlf)
    
    (f_febril)
    
    (printout t "- ¿Ha experimentado episodios febriles?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q24 (lowcase (read)))

    (if (or (eq (str-compare ?q24 "a") 0) (eq (str-compare ?q24 "b") 0)) then

        (if (eq (str-compare ?q24 "a") 0) then
            (modify ?s (fiebre "SI") (bandera 14))
        )
    else
        (while (and (neq (str-compare ?q24 "a") 0) (neq (str-compare ?q24 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado episodios febriles?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q24 (lowcase (read)))

            (if (or (eq (str-compare ?q24 "a") 0) (eq (str-compare ?q24 "b") 0)) then

                (if (eq (str-compare ?q24 "a") 0) then
                    (modify ?s (fiebre "SI") (bandera 14))
                )
            )
        )
    )
)

(defrule question25
    ?a <- (activar (valor 7))
    ?s <- (sintoma (t_maxima ?f) (bandera 14))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cúal ha sido la temperatura máxima alcanzada? (En grandos centígrados)" crlf)
    (bind ?q25 (read))

    (if (>= ?q25 0) then
        (modify ?s (t_maxima ?q25))
    else
        (while (< ?q25 0) 
            (printout t " " crlf)
            (printout t "- ¿Cúal ha sido la temperatura máxima alcanzada? (En Grados Centígrados)" crlf)
            (bind ?q25 (read))

            (if (>= ?q25 0) then
                (modify ?s (t_maxima ?q25))
            )
        )
    )
    (retract ?a)
)

(defrule question26
    ?a <- (activar (valor 8))
    ?s <- (sintoma (diarrea ?d))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha presentado diarrea?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q26 (lowcase (read)))

    (if (or (eq (str-compare ?q26 "a") 0) (eq (str-compare ?q26 "b") 0)) then

        (if (eq (str-compare ?q26 "a") 0) then
            (modify ?s (diarrea "SI"))
        )
    else
        (while (and (neq (str-compare ?q26 "a") 0) (neq (str-compare ?q26 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha presentado diarrea?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q26 (lowcase (read)))

            (if (or (eq (str-compare ?q26 "a") 0) (eq (str-compare ?q26 "b") 0)) then

                (if (eq (str-compare ?q26 "a") 0) then
                    (modify ?s (diarrea "SI"))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question27
    ?a <- (activar (valor 9))
    ?s <- (sintoma (vomito ?v) (bandera 17))
    => 
    (printout t " " crlf)
    (printout t "- ¿Experimenta episodios de vómito?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q27 (lowcase (read)))

    (if (or (eq (str-compare ?q27 "a") 0) (eq (str-compare ?q27 "b") 0)) then

        (if (eq (str-compare ?q27 "a") 0) then
            (modify ?s (vomito "SI") (bandera 18))
        )
    else
        (while (and (neq (str-compare ?q27 "a") 0) (neq (str-compare ?q27 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta episodios de vómito?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q27 (lowcase (read)))

            (if (or (eq (str-compare ?q27 "a") 0) (eq (str-compare ?q27 "b") 0)) then

                (if (eq (str-compare ?q27 "a") 0) then
                    (modify ?s (vomito "SI") (bandera 18))
                )
            )
        )
    )
)

(defrule question28
    ?a <- (activar (valor 9))
    ?s <- (sintoma (vomito_s ?vs) (bandera 18))
    => 
    (printout t " " crlf)
    (printout t "- ¿Experimenta episodios de vómito con sangre?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q28 (lowcase (read)))

    (if (or (eq (str-compare ?q28 "a") 0) (eq (str-compare ?q28 "b") 0)) then

        (if (eq (str-compare ?q28 "a") 0) then
            (modify ?s (vomito_s "SI"))
        )
    else
        (while (and (neq (str-compare ?q28 "a") 0) (neq (str-compare ?q28 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Experimenta episodios de vómito con sangre?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q28 (lowcase (read)))

            (if (or (eq (str-compare ?q28 "a") 0) (eq (str-compare ?q28 "b") 0)) then

                (if (eq (str-compare ?q28 "a") 0) then
                    (modify ?s (vomito_s "SI"))
                )
            )
        )
    )
    (retract ?a)
)

(defrule question29
    ?a <- (activar (valor 10))
    ?s <- (sintoma (nauseas ?n))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado nauseas?" crlf)
    (printout t "a. Sí, de forma frecuente" crlf)
    (printout t "b. Sí, ocasionalmente" crlf)
    (printout t "c. No" crlf)

    (bind ?q29 (lowcase (read)))

    (if (or (eq (str-compare ?q29 "a") 0) (eq (str-compare ?q29 "b") 0) 
            (eq (str-compare ?q29 "c") 0)) then

        (if (neq (str-compare ?q29 "c") 0) then
            (if (eq (str-compare ?q29 "b") 0) then
                (modify ?s (nauseas "OCASIONALMENTE"))                
            else
                (modify ?s (nauseas "FRECUENTEMENTE"))
            )
        )
    else
        (while (and (neq (str-compare ?q29 "a") 0) (neq (str-compare ?q29 "b") 0) 
                    (neq (str-compare ?q29 "c") 0)) 
            (printout t "- ¿Ha experimentado nauseas?" crlf)
            (printout t "a. Sí, de forma frecuente" crlf)
            (printout t "b. Sí, ocasionalmente" crlf)
            (printout t "c. No" crlf)

            (bind ?q29 (lowcase (read)))

            (if (or (eq (str-compare ?q29 "a") 0) (eq (str-compare ?q29 "b") 0) 
                    (eq (str-compare ?q29 "c") 0)) then

                (if (neq (str-compare ?q29 "c") 0) then
                    (if (eq (str-compare ?q29 "b") 0) then
                        (modify ?s (nauseas "OCASIONALMENTE"))                
                    else
                        (modify ?s (nauseas "FRECUENTEMENTE"))
                    )
                )
            )
        )
    )
    (retract ?a)
)

(defrule question30
    ?a <- (activar (valor 11))
    ?s <- (sintoma (escalofrio ?es))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado episodios de escalofríos?" crlf)
    (printout t "a. Sí, de forma frecuente" crlf)
    (printout t "b. Sí, ocasionalmente" crlf)
    (printout t "c. No" crlf)

    (bind ?q30 (lowcase (read)))

    (if (or (eq (str-compare ?q30 "a") 0) (eq (str-compare ?q30 "b") 0) 
            (eq (str-compare ?q30 "c") 0)) then

        (if (neq (str-compare ?q30 "c") 0) then
            (if (eq (str-compare ?q30 "b") 0) then
                (modify ?s (escalofrio "OCASIONALMENTE"))                
            else
                (modify ?s (escalofrio "FRECUENTEMENTE"))
            )
        )
    else
        (while (and (neq (str-compare ?q30 "a") 0) (neq (str-compare ?q30 "b") 0) 
                    (neq (str-compare ?q30 "c") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado episodios de escalofríos?" crlf)
            (printout t "a. Sí, de forma frecuente" crlf)
            (printout t "b. Sí, ocasionalmente" crlf)
            (printout t "c. No" crlf)

            (bind ?q30 (lowcase (read)))

            (if (or (eq (str-compare ?q30 "a") 0) (eq (str-compare ?q30 "b") 0) 
                    (eq (str-compare ?q30 "c") 0)) then

                (if (neq (str-compare ?q30 "c") 0) then
                    (if (neq (str-compare ?q30 "b") 0) then
                        (modify ?s (escalofrio "OCASIONALMENTE"))                
                    else
                        (modify ?s (escalofrio "FRECUENTEMENTE"))
                    )
                )
            )
        )
    )
    (retract ?a)
)

(defrule question31
    ?a <- (activar (valor 12))
    ?s <- (sintoma (dolor_muscular ?dm) (bandera 1))
    => 
    (printout t " " crlf)

    (f_muscular)

    (printout t "- ¿Ha experimentado dolor muscular?" crlf)
    (printout t "a. Si" crlf)
    (printout t "b. No" crlf)

    (bind ?q31 (lowcase (read)))

    (if (or (eq (str-compare ?q31 "a") 0) (eq (str-compare ?q31 "b") 0)) then

        (if (eq (str-compare ?q31 "a") 0) then
            (modify ?s (dolor_muscular "SI") (bandera 2))
        )
    else
        (while (and (neq (str-compare ?q31 "a") 0) (neq (str-compare ?q31 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado dolor muscular?" crlf)
            (printout t "a. Si" crlf)
            (printout t "b. No" crlf)

            (bind ?q31 (lowcase (read)))

            (if (or (eq (str-compare ?q31 "a") 0) (eq (str-compare ?q31 "b") 0)) then

                (if (eq (str-compare ?q31 "a") 0) then
                    (modify ?s (dolor_muscular "SI") (bandera 2))
                )
            )
        )
    )
)

(defrule question32
    ?a <- (activar (valor 12))
    ?s <- (sintoma (dias_dolor_muscular ?dd) (bandera 2))
    => 
    (printout t " " crlf)
    (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
    (printout t "a. Una semana o menos" crlf)
    (printout t "b. De 2 a 3 semanas" crlf)
    (printout t "c. Aproximadamente 1 mes" crlf)
    (printout t "d. Más de un mes" crlf)

    (bind ?q32 (lowcase (read)))

    (if (or (eq (str-compare ?q32 "a") 0) (eq (str-compare ?q32 "b") 0) 
        (eq (str-compare ?q32 "c") 0) (eq (str-compare ?q32 "d") 0)) then

        (if (eq (str-compare ?q32 "a") 0) then
            (modify ?s (dias_dolor_muscular "RANGO 1"))
        else
            (if (eq (str-compare ?q32 "b") 0) then
                (modify ?s (dias_dolor_muscular "RANGO 2"))
            else
                (if (eq (str-compare ?q32 "c") 0) then
                    (modify ?s (dias_dolor_muscular "RANGO 3"))
                else
                    (modify ?s (dias_dolor_muscular "RANGO 4"))
                )
            )
        )
    else
        (while (and (neq (str-compare ?q32 "a") 0) (neq (str-compare ?q32 "b") 0) 
                    (neq (str-compare ?q32 "c") 0) (neq (str-compare ?q32 "d") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Cuánto tiempo ha durado esta sensación?" crlf)
            (printout t "a. Una semana o menos" crlf)
            (printout t "b. De 2 a 3 semanas" crlf)
            (printout t "c. Aproximadamente 1 mes" crlf)
            (printout t "d. Más de un mes" crlf)

            (bind ?q32 (lowcase (read)))

            (if (or (eq (str-compare ?q32 "a") 0) (eq (str-compare ?q32 "b") 0) 
                    (eq (str-compare ?q32 "c") 0) (eq (str-compare ?q32 "d") 0)) then

                (if (eq (str-compare ?q32 "a") 0) then
                    (modify ?s (dias_dolor_muscular "RANGO 1"))
                else
                    (if (eq (str-compare ?q32 "b") 0) then
                        (modify ?s (dias_dolor_muscular "RANGO 2"))
                    else
                        (if (eq (str-compare ?q32 "c") 0) then
                            (modify ?s (dias_dolor_muscular "RANGO 3"))
                        else
                            (modify ?s (dias_dolor_muscular "RANGO 4"))
                        )
                    )
                )
            )
        )
    )
    (retract ?a)
)

(defrule question33
    ?a <- (activar (valor 13))
    ?s <- (sintoma (perdida_apetito ?pa))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado falta de apetito en los últimos días?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q33 (lowcase (read)))

    (if (or (eq (str-compare ?q33 "a") 0) (eq (str-compare ?q33 "b") 0)) then

        (if (eq (str-compare ?q33 "a") 0) then
            (modify ?s (perdida_apetito "SI"))                
        )
    else
        (while (and (neq (str-compare ?q33 "a") 0) (neq (str-compare ?q33 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado falta de apetito en los últimos días?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q33 (lowcase (read)))

            (if (or (eq (str-compare ?q33 "a") 0) (eq (str-compare ?q33 "b") 0)) then

                (if (neq (str-compare ?q33 "a") 0) then
                    (modify ?s (perdida_apetito "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question34
    ?a <- (activar (valor 14))
    ?s <- (sintoma (icteria ?i))
    => 
    (printout t " " crlf)
    (printout t "- ¿Su piel y/o mucosas se han tornado amarillentas?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q34 (lowcase (read)))

    (if (or (eq (str-compare ?q34 "a") 0) (eq (str-compare ?q34 "b") 0)) then

        (if (eq (str-compare ?q34 "a") 0) then
            (modify ?s (icteria "SI"))                
        )
    else
        (while (and (neq (str-compare ?q34 "a") 0) (neq (str-compare ?q34 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Su piel y/o mucosas se han tornado amarillentas?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q34 (lowcase (read)))

            (if (or (eq (str-compare ?q34 "a") 0) (eq (str-compare ?q34 "b") 0)) then

                (if (neq (str-compare ?q34 "a") 0) then
                    (modify ?s (icteria "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question35
    ?a <- (activar (valor 15))
    ?s <- (sintoma (dif_tragar ?dt))
    => 
    (printout t " " crlf)

    (f_tragar)

    (printout t "- ¿Presenta dificultad para digerir sus alimentos?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q35 (lowcase (read)))

    (if (or (eq (str-compare ?q35 "a") 0) (eq (str-compare ?q35 "b") 0)) then

        (if (eq (str-compare ?q35 "a") 0) then
            (modify ?s (dif_tragar "SI"))                
        )
    else
        (while (and (neq (str-compare ?q35 "a") 0) (neq (str-compare ?q35 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Presenta dificultad para digerir sus alimentos?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q35 (lowcase (read)))

            (if (or (eq (str-compare ?q35 "a") 0) (eq (str-compare ?q35 "b") 0)) then

                (if (neq (str-compare ?q35 "a") 0) then
                    (modify ?s (dif_tragar "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question36
    ?a <- (activar (valor 16))
    ?s <- (sintoma (sangrado_nasal ?sn))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado sangrado nasal?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q36 (lowcase (read)))

    (if (or (eq (str-compare ?q36 "a") 0) (eq (str-compare ?q36 "b") 0)) then

        (if (eq (str-compare ?q36 "a") 0) then
            (modify ?s (sangrado_nasal "SI"))                
        )
    else
        (while (and (neq (str-compare ?q36 "a") 0) (neq (str-compare ?q36 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado sangrado nasal?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q36 (lowcase (read)))

            (if (or (eq (str-compare ?q36 "a") 0) (eq (str-compare ?q36 "b") 0)) then

                (if (neq (str-compare ?q36 "a") 0) then
                    (modify ?s (sangrado_nasal "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question37
    ?a <- (activar (valor 17))
    ?s <- (sintoma (ulceras_boca ?ub))
    => 
    (printout t " " crlf)
    (printout t "- ¿Presenta úlceras en boca, lengua, encias, labios y/o nariz?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q37 (lowcase (read)))

    (if (or (eq (str-compare ?q37 "a") 0) (eq (str-compare ?q37 "b") 0)) then

        (if (eq (str-compare ?q37 "a") 0) then
            (modify ?s (ulceras_boca "SI"))                
        )
    else
        (while (and (neq (str-compare ?q37 "a") 0) (neq (str-compare ?q37 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Presenta úlceras en boca, lengua, encias, labios y/o nariz?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q37 (lowcase (read)))

            (if (or (eq (str-compare ?q37 "a") 0) (eq (str-compare ?q37 "b") 0)) then

                (if (neq (str-compare ?q37 "a") 0) then
                    (modify ?s (ulceras_boca "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question38
    ?a <- (activar (valor 18))
    ?s <- (sintoma (piel_gris ?pg))
    => 
    (printout t " " crlf)
    (printout t "- ¿La apariencia de su piel es escamosa, grisácea, oscura y/o pálida?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q38 (lowcase (read)))

    (if (or (eq (str-compare ?q38 "a") 0) (eq (str-compare ?q38 "b") 0)) then

        (if (eq (str-compare ?q38 "a") 0) then
            (modify ?s (piel_gris "SI"))                
        )
    else
        (while (and (neq (str-compare ?q38 "a") 0) (neq (str-compare ?q38 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿La apariencia de su piel es escamosa, grisácea, oscura y/o pálida?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q38 (lowcase (read)))

            (if (or (eq (str-compare ?q38 "a") 0) (eq (str-compare ?q38 "b") 0)) then

                (if (neq (str-compare ?q38 "a") 0) then
                    (modify ?s (piel_gris "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

(defrule question39
    ?a <- (activar (valor 19))
    ?s <- (sintoma (perdida_peso ?pp))
    => 
    (printout t " " crlf)
    (printout t "- ¿Ha experimentado bajas de peso recientemente?" crlf)
    (printout t "a. Sí" crlf)
    (printout t "b. No" crlf)

    (bind ?q39 (lowcase (read)))

    (if (or (eq (str-compare ?q39 "a") 0) (eq (str-compare ?q39 "b") 0)) then

        (if (eq (str-compare ?q39 "a") 0) then
            (modify ?s (perdida_peso "SI"))                
        )
    else
        (while (and (neq (str-compare ?q39 "a") 0) (neq (str-compare ?q39 "b") 0)) 
            (printout t " " crlf)
            (printout t "- ¿Ha experimentado bajas de peso recientemente?" crlf)
            (printout t "a. Sí" crlf)
            (printout t "b. No" crlf)

            (bind ?q39 (lowcase (read)))

            (if (or (eq (str-compare ?q39 "a") 0) (eq (str-compare ?q39 "b") 0)) then

                (if (neq (str-compare ?q39 "a") 0) then
                    (modify ?s (perdida_peso "SI"))    
                )
            )
        )
    )
    (retract ?a)
)

; **************************" 
; *     DENGUE CLÁSICO     *" 
; **************************" 

(defrule dengue_clasico1
    (metarule_sint (valor 10))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera 0))
    => 
    (retract ?a)

    (assert (activar (valor 1)))     ; Dolor de cabeza 
)

(defrule dengue_clasico2
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b & : (eq ?b 1)))
    => 
    (modify ?s (bandera 3))

    (assert (activar (valor 2)))     ; Erupciones cara y extremidades
)

(defrule dengue_clasico3
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 3) (eq ?b 4))))
    => 
    (assert (auxiliares (aux1 ?b) (aux2 0)))

    (modify ?s (bandera 6))
    (assert (activar (valor 3)))     ; Erupciones cuerpo  
)

(defrule dengue_clasico4
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux1 ?aux) (aux2 0))
    => 
    (if (or (eq ?b 7) (eq ?aux 4)) then
        (modify ?s (bandera 7))
        (modify ?ac (aux2 -5))
        (assert (activar (valor 4)))     ; Tipo de Erupciones
    )    
)

(defrule dengue_clasico5
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux2 ?a & : (eq ?a -5)))
    => 
    (modify ?s (bandera 9))
    (modify ?ac (aux2 -4))
    (assert (activar (valor 5)))     ; Dolor articular   
)

(defrule dengue_clasico6
    (metarule_sint (valor 10))
    ?ac <- (auxiliares (aux2 -4))
    => 
    (modify ?ac (aux2 -3))
    (assert (activar (valor 8)))     ; Diarrea
)

(defrule dengue_clasico7
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux2 -3))
    => 
    (modify ?s (bandera 17))
    (modify ?ac (aux2 -2))
    (assert (activar (valor 10)))     ; Nauseas
)

(defrule dengue_clasico8
    (metarule_sint (valor 10))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux2 -2))
    => 
    (modify ?ac (aux2 -1))
    (modify ?s (bandera 17))    
    (assert (activar (valor 9)))     ; Vómito    
)

(defrule dengue_clasico9
    (metarule_sint (valor 10))
    ?ac <- (auxiliares (aux2 -1))
    =>
    (retract ?ac)
    (assert (activar (valor -666))) 
)

; **************************" 
; *      FIEBRE TÓXICA     *" 
; **************************" 

(defrule fiebre_toxica1
    (metarule_sint (valor 20))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera ?b & : (eq ?b 0)))
    => 
    (retract ?a)

    (modify ?s (bandera 17))    
    (assert (activar (valor 9)))     ; Vómito
)

(defrule fiebre_toxica2
    (metarule_sint (valor 20))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 17) (eq ?b 18))))
    => 
    (modify ?s (bandera 33))

    (assert (activar (valor 14)))     ; Icteria
)

(defrule fiebre_toxica3
    (metarule_sint (valor 20))
    ?s <- (sintoma (bandera 33))
    =>
    (modify ?s (bandera 43))
    (assert (activar (valor -666))) 
)

; **************************" 
; * LEISHMANIASIS VISCERAL *" 
; **************************" 

(defrule leish_visceral1
    (metarule_sint (valor 30))
    ?a <- (activar (valor 0))
    => 
    (modify ?a (valor 100))
    (assert (activar (valor 13)))     ; Inapetencia
)

(defrule leish_visceral2
    (metarule_sint (valor 30))
    ?a <- (activar (valor 100))
    => 
    (retract ?a) 
    (assert (auxiliares (aux1 101) (aux2 201)))
    (assert (activar (valor 16)))     ; Sangrado Nasal
)

(defrule leish_visceral3
    (metarule_sint (valor 30))
    ?ac <- (auxiliares (aux1 101) (aux2 201))
    => 
    (modify ?ac (aux1 1010) (aux2 2010))
    (assert (activar (valor 17)))     ; Ulceras Boca
)

(defrule leish_visceral4
    (metarule_sint (valor 30))
    ?ac <- (auxiliares (aux1 1010) (aux2 2010))
    => 
    (modify ?ac (aux1 1110) (aux2 2110))
    (assert (activar (valor 18)))     ; Piel Gris
)

(defrule leish_visceral5
    (metarule_sint (valor 30))
    ?ac <- (auxiliares (aux1 1110) (aux2 2110))
    => 
    (modify ?ac (aux1 -1110) (aux2 -2110))
    (assert (activar (valor 19)))     ; Perdida de peso
)

(defrule leish_visceral6
    (metarule_sint (valor 30))
    ?ac <- (auxiliares (aux1 -1110) (aux2 -2110))
    =>
    (retract ?ac) 
    (assert (activar (valor -666))) 
)

; **************************" 
; *        MALARIA         *" 
; **************************" 

(defrule malaria1
    (metarule_sint (valor 40))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera 0))
    => 
    (retract ?a)

    (assert (activar (valor 1)))     ; Dolor de cabeza     
)

(defrule malaria2
    (metarule_sint (valor 40))
    ?s <- (sintoma (bandera ?b & : (eq ?b 1)))
    => 
    (modify ?s (bandera 3))

    (assert (activar (valor 6)))     ; Dificultad respiratoria
)

(defrule malaria3
    (metarule_sint (valor 40))
    ?s <- (sintoma (bandera ?b & : (eq ?b 3)))
    => 
    (modify ?s (bandera 17))    
    (assert (activar (valor 9)))     ; Vómito
)

(defrule malaria4
    (metarule_sint (valor 40))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 17) (eq ?b 18))))
    =>    
    (modify ?s (bandera 19)) 
    (assert (activar (valor 11)))     ; Escalofríos
)

(defrule malaria5
    (metarule_sint (valor 40))
    ?s <- (sintoma (bandera 19))
    =>
    (modify ?s (bandera -99))
    (assert (activar (valor -666))) 
)

; **************************" 
; * LEISHMANIASIS CLÁSICA  *" 
; **************************" 

(defrule leish_clasica1
    (metarule_sint (valor 50))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera ?b))
    => 
    (retract ?a)
    (modify ?s (bandera 3))

    (assert (activar (valor 2)))     ; Erupciones cara y extremidades
)

(defrule leish_clasica2
    (metarule_sint (valor 50))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 3) (eq ?b 4))))
    => 
    (assert (auxiliares (aux1 ?b) (aux2 0)))

    (modify ?s (bandera 6))
    (assert (activar (valor 3)))     ; Erupciones cuerpo  
)

(defrule leish_clasica3
    (metarule_sint (valor 50))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux1 ?aux) (aux2 0))
    => 
    (bind ?temp ?aux)
    (modify ?ac (aux1 12) (aux2 23))
    
    (if (or (eq ?b 7) (eq ?temp 4)) then
        (modify ?s (bandera 7))        
        (assert (activar (valor 4)))     ; Tipo de Erupciones
    )    
)

(defrule leish_clasica4
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 12) (aux2 23))
    => 
    (modify ?ac (aux1 121) (aux2 231))
    (assert (activar (valor 13)))     ; Inapetencia
)

(defrule leish_clasica5
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 121) (aux2 231))
    => 
    (modify ?ac (aux1 101) (aux2 201))
    (assert (activar (valor 15)))     ; Dificultad para tragar
)

(defrule leish_clasica6
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 101) (aux2 201))
    => 
    (modify ?ac (aux1 1010) (aux2 2010))
    (assert (activar (valor 17)))     ; Ulceras Boca
)

(defrule leish_clasica7
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 1010) (aux2 2010))
    => 
    (modify ?ac (aux1 1110) (aux2 2110))
    (assert (activar (valor 18)))     ; Piel Gris
)

(defrule leish_clasica8
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 1110) (aux2 2110))
    => 
    (modify ?ac (aux1 -1110) (aux2 -2110))
    (assert (activar (valor 19)))     ; Perdida de peso
)

(defrule leish_clasica9
    (metarule_sint (valor 50))
    ?ac <- (auxiliares (aux1 -1110) (aux2 -2110))
    =>
    (retract ?ac) 
    (assert (activar (valor -666))) 
)

; **************************" 
; *      DENGUE GRAVE      *" 
; **************************" 

(defrule dengue_grave1
    (metarule_sint (valor 60))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera 0))
    => 
    (retract ?a)
    
    (modify ?s (bandera 1))
    (assert (auxiliares (aux1 -10) (aux2 -10)))
    (assert (activar (valor 6)))     ; Dificultad Respiratoria
)

(defrule dengue_grave2
    (metarule_sint (valor 60))
    ?a <- (auxiliares (aux1 -10) (aux2 -10))
    ?s <- (sintoma (bandera 1))
    => 
    (modify ?a (aux1 -9))
    (assert (activar (valor 12)))     ; Dolor Abdominal (muscular)
)

(defrule dengue_grave3
    (metarule_sint (valor 60))
    ?a <- (auxiliares (aux1 -9) (aux2 -10))
    =>
    (modify ?a (aux1 -99))
    (assert (activar (valor -666))) 
)

; **************************" 
; *      FIEBRE AGUDA      *" 
; **************************" 

(defrule fiebre_aguda1
    (metarule_sint (valor 80))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera 0))
    => 
    (retract ?a)

    (assert (activar (valor 1)))     ; Dolor de cabeza     
)

(defrule fiebre_aguda2
    (metarule_sint (valor 80))
    ?s <- (sintoma (bandera ?b & : (eq ?b 1)))
    => 
    (modify ?s (bandera 13))    

    (assert (activar (valor 7)))     ; Fiebre 
)

(defrule fiebre_aguda3
    (metarule_sint (valor 80))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 13) (eq ?b 14))))
    => 
    (modify ?s (bandera 17))    
    (assert (activar (valor 9)))     ; Vómito
)

(defrule fiebre_aguda4
    (metarule_sint (valor 80))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 17) (eq ?b 18))))
    => 
    (modify ?s (bandera 1)) 
    (assert (activar (valor 12)))     ; Dolor Espalda (muscular)
)

(defrule fiebre_aguda5
    (metarule_sint (valor 80))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 1) (eq ?b 2))))
    => 
    (modify ?s (bandera 30)) 
    (assert (activar (valor 13)))     ; Inapetencia
)

(defrule fiebre_aguda6
    (metarule_sint (valor 80))
    ?s <- (sintoma (bandera 30))
    =>
    (modify ?s (bandera 60)) 
    (assert (activar (valor -666))) 
)

; **************************" 
; *      CHICUNGUNYA       *" 
; **************************" 

(defrule chicungunya1
    (metarule_sint (valor 90))
    ?a <- (activar (valor 0))
    ?s <- (sintoma (bandera 0))
    => 
    (retract ?a)

    (assert (activar (valor 1)))     ; Dolor de cabeza 
)

(defrule chicungunya2
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b & : (eq ?b 1)))
    => 
    (modify ?s (bandera 3))

    (assert (activar (valor 2)))     ; Erupciones cara y extremidades
)

(defrule chicungunya3
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 3) (eq ?b 4))))
    => 
    (assert (auxiliares (aux1 ?b) (aux2 0)))

    (modify ?s (bandera 6))
    (assert (activar (valor 3)))     ; Erupciones cuerpo  
)

(defrule chicungunya4
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux1 ?aux) (aux2 0))
    => 
    (modify ?ac (aux2 -5))
    (if (or (eq ?b 7) (eq ?aux 4)) then
        (modify ?s (bandera 7))        
        (assert (activar (valor 4)))     ; Tipo de Erupciones
    )    
)

(defrule chicungunya5
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b))
    ?ac <- (auxiliares (aux2 ?a & : (eq ?a -5)))
    => 
    (modify ?s (bandera 9))
    (modify ?ac (aux2 -4))
    (assert (activar (valor 5)))     ; Dolor articular 
)

(defrule chicungunya6
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 9) (eq ?b 10))))
    => 
    (modify ?s (bandera 13))    
    (assert (activar (valor 7)))     ; Fiebre 
)

(defrule chicungunya7
    (metarule_sint (valor 90))
    ?s <- (sintoma (bandera ?b & : (or (eq ?b 13) (eq ?b 14))))
    =>
    (modify ?s (bandera 77)) 
    (assert (activar (valor -666))) 
)

; **************************" 
; *          OTROS         *" 
; **************************" 

(defrule otros
    (metarule_sint (valor ?v & : (or (eq ?v 70) (eq ?v 100))))
    ?a <- (activar (valor 0))
    => 
    (retract ?a)    
    (printout t crlf crlf)
    (printout t " Su sintomatología no permite asegurar que usted posea una enfermedad tropical" crlf)
    (printout t " Le recomendamos visitar el centro de salud más cercano para una valoración " crlf)
    (printout t " profesional" crlf crlf)
)


(defrule final
    ?s <- (sintoma (malestar_general ?mg) (dias_malestar ?dmg) (fiebre ?f) (t_maxima ?tmax) (t_descenso ?td) 
                    (t_minima ?tmin) (dolor_muscular ?dmus) (dias_dolor_muscular ?ddm) (dolor_articular ?dart) 
                    (dias_dolor_articular ?dda) (dolor_ocular ?docu) (dias_dolor_articular ?ddo) (nauseas ?n) 
                    (vomito ?v) (vomito_s ?vs) (diarrea ?dia) (escalofrio ?esc) (cefalea ?cef) (dias_cefalea ?dc) 
                    (sangrado_nasal ?sn) (dificultad_respiratoria ?dr) (erupciones_cutaneas_extcara ?ece) 
                    (erupciones_cutaneas_general ?ecg) (tipo_erupciones ?te) (perdida_apetito ?pa) (icteria ?i) 
                    (dif_tragar ?dt) (ulceras_boca ?ub) (piel_gris ?pg) (perdida_peso ?pp))
    ?a <- (activar (valor -666))
    =>

    (bind ?en10 0)
    (bind ?en20 0)
    (bind ?en30 0)
    (bind ?en40 0)
    (bind ?en50 0)
    (bind ?en60 0)
    (bind ?en80 0)
    (bind ?en90 0)

    (bind ?mgp 0)
    (bind ?dmalp 0)
    (bind ?fp 0)
    (bind ?tmaxp 0)
    (bind ?tdp 0)
    (bind ?tminp 0)
    (bind ?dmusp 0)
    (bind ?ddmp 0)
    (bind ?dartp 0)
    (bind ?ddap 0)
    (bind ?docup 0)
    (bind ?ddop 0)

    (bind ?np 0)
    (bind ?vp 0)
    (bind ?vsp 0)
    (bind ?diap 0)
    (bind ?escp 0)	

    (bind ?cefp 0)
    (bind ?dcp 0)

    (bind ?snp 0)
    (bind ?drp 0)

    (bind ?ecep 0)
    (bind ?ecgp 0)
    (bind ?tep 0)

    (bind ?pap 0)
    (bind ?ip 0)
    (bind ?dtp 0)
    (bind ?ubp 0)
    (bind ?pgp 0)
    (bind ?ppp 0)	

    (if (eq (str-compare ?mg "SI") 0) then
        (bind ?mgp 1)
        (if (or (eq (str-compare ?dmg "RANGO 1") 0) (eq (str-compare ?dmg "RANGO 2") 0)) then
            (bind ?dmalp 1)
        else
            (bind ?dmalp 0.5)
        )		
    )

    (if (eq (str-compare ?f "SI") 0) then
        (bind ?fp 1)
        (if (or (> ?tmax 37) (<= ?tmax 40)) then
            (bind ?tmaxp 0.5)
        else
            (if (> ?tmax 40) then
                (bind ?tmaxp 1)
            )	
        )		
    )

    (if (eq (str-compare ?td "SI") 0) then
        (bind ?tdp 1)
        (if (or (> ?tmin 34) (< ?tmin 37)) then
            (bind ?tminp 0.5)
        else
            (if (or (> ?tmin 0) (<= ?tmin 34)) then
                (bind ?tminp 1)
            )	
        )		
    )

    (if (eq (str-compare ?dmus "SI") 0) then
        (bind ?dmusp 1)
        (if (or (eq (str-compare ?ddm "RANGO 1") 0) (eq (str-compare ?ddm "RANGO 2") 0)) then
            (bind ?ddmp 1)
        else
            (bind ?ddmp 0.5)
        )		
    )

    (if (eq (str-compare ?dart "SI") 0) then
        (bind ?dartp 1)
        (if (or (eq (str-compare ?dda "RANGO 1") 0) (eq (str-compare ?dda "RANGO 2") 0)) then
            (bind ?ddap 1)
        else
            (bind ?ddap 0.5)
        )		
    )

    (if (eq (str-compare ?docu "SI") 0) then
        (bind ?docup 1)
        (if (or (eq (str-compare ?ddo "RANGO 1") 0) (eq (str-compare ?ddo "RANGO 2") 0)) then
            (bind ?ddop 1)
        else
            (bind ?ddop 0.5)
        )		
    )

    (if (eq (str-compare ?n "FRECUENTEMENTE") 0) then
        (bind ?np 1)		
    else
        (if (eq (str-compare ?n "OCASIONALMENTE") 0) then
            (bind ?np 0.6)
        )
    )

    (if (eq (str-compare ?v "SI") 0) then
        (bind ?vp 1)
    )

    (if (eq (str-compare ?vs "SI") 0) then
        (bind ?vsp 1)
    )

    (if (eq (str-compare ?dia "SI") 0) then
        (bind ?diap 1)
    )

    (if (eq (str-compare ?esc "FRECUENTEMENTE") 0) then
        (bind ?escp 1)
    else
        (if (eq (str-compare ?esc "OCASIONALMENTE") 0) then
            (bind ?escp 0.6)
        )
    )

    (if (eq (str-compare ?cef "SI") 0) then
        (bind ?cefp 1)

        (if (eq (str-compare ?dc "RANGO 1") 0) then
            (bind ?dcp 1)
        else
            (if (eq (str-compare ?dc "RANGO 2") 0) then
                (bind ?dcp 0.5)
            else
                (bind ?dcp 0.2)
            )
        )
    )

    (if (eq (str-compare ?sn "SI") 0) then
        (bind ?snp 1)
    )

    (if (eq (str-compare ?dr "FRECUENTEMENTE") 0) then
        (bind ?drp 1)
    else
        (if (eq (str-compare ?dr "OCASIONALMENTE") 0) then
            (bind ?drp 0.6)
        )
    )

    (if (eq (str-compare ?ece "SI") 0) then
        (bind ?ecep 1)
    )

    (if (eq (str-compare ?ecg "SI") 0) then
        (bind ?ecgp 1)
    )

    (if (or (eq (str-compare ?ece "SI") 0) (eq (str-compare ?ecg "SI") 0)) then
        (bind ?tep 1)
    )	

    (if (eq (str-compare ?pa "SI") 0) then
        (bind ?pap 1)
    )

    (if (eq (str-compare ?i "SI") 0) then
        (bind ?ip 1)
    )

    (if (eq (str-compare ?dt "SI") 0) then
        (bind ?dtp 1)
    )

    (if (eq (str-compare ?ub "SI") 0) then
        (bind ?ubp 1)
    )

    (if (eq (str-compare ?pg "SI") 0) then
        (bind ?pgp 1)
    )

    (if (eq (str-compare ?pp "SI") 0) then
        (bind ?ppp 1)
    )

    (bind ?en10 (* (+ ?en10 (+ (+ (+ (+ (+ (* ?mgp 0.05) (* ?dmalp 0.05)) (+ (* ?fp 0.05) (* ?tmaxp 0.05))) (+ (* ?dmusp 0.05) (* ?ddmp 0.05))) (+ (* ?docup 0.05) (* ?ddop 0.05))) (+ (* ?cefp 0.05) (* ?dcp 0.05)) (+ (+ (+ (+ (* ?ecep 0.04) (* ?ecgp 0.04)) (* ?tep 0.02)) (+ (* ?dartp 0.05) (* ?ddap 0.05))) (+ (+ (* ?diap 0.1) (* ?np 0.1)) (+ (* ?vp 0.05) (* ?vsp 0.05)))))) 100))
    (bind ?en20 (* (+ ?en20 (+ (+ (+ (+ (* ?mgp 0.1) (* ?dmalp 0.1)) (+ (* ?fp 0.1) (* ?tmaxp 0.1))) (+ (* ?dmusp 0.1) (* ?ddmp 0.1))) (+ (+ (* ?vp 0.1) (* ?vsp 0.1)) (* ?ip 0.2)))) 100))	
    (bind ?en30 (* (+ ?en40 (+ (+ (+ (* ?mgp 0.0625) (* ?dmalp 0.0625)) (+ (* ?fp 0.0625) (* ?tmaxp 0.0625))) (+ (* ?pap 0.125) (+ (* ?snp 0.125) (+ (* ?diap 0.125) (+ (+ (* ?ubp 0.125) (* ?pgp 0.125)) (* ?ppp 0.125))))))) 100))
    (bind ?en40 (* (+ ?en40 (+ (+ (+ (* ?mgp 0.083) (* ?dmalp 0.083)) (+ (* ?fp 0.083) (* ?tmaxp 0.083))) (+ (+ (* ?cefp 0.083) (* ?dcp 0.083)) (+ (+ (* ?drp 0.166) (* ?escp 0.166)) (+ (* ?vp 0.083) (* ?vsp 0.083)))))) 100))
    (bind ?en50 (* (+ ?en60 (+ (+ (* ?mgp 0.071) (* ?dmalp 0.071)) (+ (+ (+ (* ?ecep 0.0568) (* ?ecgp 0.0568)) (* ?tep 0.0284)) (+ (* ?pap 0.142) (+ (* ?dtp 0.142) (+ (* ?ubp 0.142) (+ (* ?pgp 0.142) (* ?ppp 0.142)))))))) 100))
    (bind ?en60 (* (+ ?en60 (+ (+ (+ (+ (* ?mgp 0.1) (* ?dmalp 0.1)) (+ (+ (* ?tdp 0.1) (* ?tminp 0.01)) (+ (* ?drp 0.2) (+ (* ?dmusp 0.1) (* ?ddmp 0.1))))) (* ?vp 0.1)) (* ?vsp 0.1))) 100))
    (bind ?en80 (* (+ ?en80 (+ (+ (* ?np 0.142) (* ?escp 0.142)) (+ (+ (* ?cefp 0.071) (* ?dcp 0.071)) (+ (+ (* ?fp 0.071) (* ?tmaxp 0.071)) (+ (+ (* ?vp 0.071) (* ?vsp 0.071)) (+ (+ (* ?dmusp 0.071) (* ?ddmp 0.071)) (* ?pap 0.142))))))) 100))
    (bind ?en90 (* (+ ?en90 (+ (* ?np 0.2) (+ (+ (* ?cefp 0.1) (* ?dcp 0.1)) (+ (+ (+ (* ?ecep 0.08) (* ?ecgp 0.08)) (* ?tep 0.04)) (+ (+ (* ?dartp 0.1) (* ?ddap 0.1)) (+ (* ?fp 0.1) (* ?tmaxp 0.1))))))) 100))
    
    (printout t crlf crlf)
    (printout t " Probabilidades de poseer una Enfermedad Tropical:" crlf crlf)
    (printout t " Dengue Clásico : " ?en10 " % " crlf)
    (printout t " Dengue Grave : " ?en60 " % " crlf)
    (printout t " Fiebre Amarilla Aguda : " ?en80 " % " crlf)
    (printout t " Fiebre Amarilla Tóxica : " ?en20 " % " crlf)
    (printout t " Leishmaniasis Clásica : " ?en50 " % " crlf)
    (printout t " Leishmaniasis Visceral : " ?en30 " % " crlf)
    (printout t " Chicungunya : " ?en90 " % " crlf)
    (printout t " Malaria : " ?en40 " % " crlf crlf)
)