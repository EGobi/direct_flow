/* 
direct_flow
Fluxograma para RS - programa bilingue
v9
13/06/2022

Rafael Leite Pacheco
rleitepacheco@hotmail.com 

*/



capture program drop direct_flow

program define direct_flow

* version 17

syntax [if] [in] [, model(string) n_databases(string) n_other_sources(string) n_duplicates(string) n_after_duplicates(string) n_first_phase(string) n_excluded_first_phase(string) n_second_phase(string) n_excluded_second_phase(string) n_awaiting_classification(string) n_included_reports(string) n_included_studies(string) n_included_completed(string) n_included_ongoing(string) n_included_qualitative(string) n_included_quantitative(string) language(string) *]

	if "`model'" == "1" {
	
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'
		local ongoing `n_included_ongoing'
		local completed `n_included_completed'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" 
            	if "`n_included_completed'" == "1" {
                local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizado / `ongoing' em andamento)"
            } 
            	else { 
				local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizados / `ongoing' em andamento)" 
            }
			local texto_caixa_10 "Estudos incluídos na síntese qualitativa (n = `incluidos_sintese_qualitativa')" "Estudos incluídos na síntese quantitativa (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.50 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
				
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"  "(`completed' completed / `ongoing' ongoing)"
			local texto_caixa_10 "Studies included in qualitative synthesis (n = `incluidos_sintese_qualitativa')" "Studies included in quantitative synthesis (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"



			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		}
 

	} 
	
	else if "`model'" == "2" { 


		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências após a exclusão de duplicatas
		local after_duplicatas `n_after_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'
		local ongoing `n_included_ongoing'
		local completed `n_included_completed'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_4 "Referências após eliminar duplicatas" "(n = `after_duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" 
            	if "`n_included_completed'" == "1" {
                local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizado / `ongoing' em andamento)"
            } 
            	else { 
				local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizados / `ongoing' em andamento)" 
            }
			local texto_caixa_10 "Estudos incluídos na síntese qualitativa (n = `incluidos_sintese_qualitativa')" "Estudos incluídos na síntese quantitativa (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.50 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_4 "Records after removing duplicates" "(n = `after_duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"  "(`completed' completed / `ongoing' ongoing)"
			local texto_caixa_10 "Studies included in qualitative synthesis (n = `incluidos_sintese_qualitativa')" "Studies included in quantitative synthesis (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}
 

	} 

	else if "`model'" == "3" {
		
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências após a exclusão de duplicatas
		local after_duplicatas `n_after_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos awaiting classification
		local awaiting_classification `n_awaiting_classification'

		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'
		local ongoing `n_included_ongoing'
		local completed `n_included_completed'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_4 "Referências após eliminar duplicatas" "(n = `after_duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" "Referências aguardando" "classificação" "(n = `n_awaiting_classification')"
			    if "`n_included_completed'" == "1" {
                local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizado / `ongoing' em andamento)"
            } 
            	else { 
				local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizados / `ongoing' em andamento)" 
            }
			local texto_caixa_10 "Estudos incluídos na síntese qualitativa (n = `incluidos_sintese_qualitativa')" "Estudos incluídos na síntese quantitativa (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 1.85 3`seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.43 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_4 "Records after removing duplicates" "(n = `after_duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" "Records awaiting" "classification" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"  "(`completed' completed / `ongoing' ongoing)"
			local texto_caixa_10 "Studies included in qualitative synthesis (n = `incluidos_sintese_qualitativa')" "Studies included in quantitative synthesis (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}
	
	
	}

	else if "`model'" == "4" {
		
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos awaiting classification
		local awaiting_classification `n_awaiting_classification'

		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'
		local ongoing `n_included_ongoing'
		local completed `n_included_completed'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" "Referências aguardando" "classificação" "(n = `n_awaiting_classification')"
			    if "`n_included_completed'" == "1" {
                local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizado / `ongoing' em andamento)"
            } 
            	else { 
				local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')"  "(`completed' finalizados / `ongoing' em andamento)" 
            }
			local texto_caixa_10 "Estudos incluídos na síntese qualitativa (n = `incluidos_sintese_qualitativa')" "Estudos incluídos na síntese quantitativa (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.43 `seta' ///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" "Records awaiting" "classification" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"  "(`completed' completed / `ongoing' ongoing)"
			local texto_caixa_10 "Studies included in qualitative synthesis (n = `incluidos_sintese_qualitativa')" "Studies included in quantitative synthesis (n = `incluidos_sintese_quantitativa')"

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.90 3 `seta' ///
			|| pci 0.7 3 0.3 3 `linha' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.7 3 "`texto_caixa_9'" `caixa') /// caixa 9
			text(0.3 3 "`texto_caixa_10'" `caixa') /// caixa 10
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}
	
	
	}

	else if "`model'" == "5" {
		
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos awaiting classification
		local awaiting_classification `n_awaiting_classification'

		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'


		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" "Referências aguardando" "classificação" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')" 
            
			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"

			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.55 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.15 3 3.15 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.45 `seta' ///
			|| pcarrowi 1.15 3 1.15 3.42 `seta' ///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.15 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.15 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" "Records awaiting" "classification" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"
			
			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.55 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.15 3 3.15 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.15 3 1.15 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.15 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.15 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}
	
	
	}

    else if "`model'" == "6" {
		
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'


		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Referências de estudos incluídos (n = `reports_incluidos')" "Estudos incluídos na revisão (n = `incluidos_revisão')" 
            
			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"

			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.55 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.15 3 3.15 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.45 `seta' ///
			|| pcarrowi 1.15 3 1.15 3.50 `seta' ///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.15 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.15 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Reports of included studies (n = `reports_incluidos')" "Studies included in the review (n = `incluidos_revisão')"
			
			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.55 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.15 3 3.15 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.15 3 1.15 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.15 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.15 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}
	
	
	}

	else if "`model'" == "overview_1" {
		
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Referências de revisões incluídas" "(n = `reports_incluidos')" "Revisões incluídas" "(n = `incluidos_revisão')"  


			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.50 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Reports of included reviews" "(n = `reports_incluidos')" "Reviews included" "(n = `incluidos_revisão')"  

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}

	}	

	else if "`model'" == "overview_2" {
				
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências após a exclusão de duplicatas
		local after_duplicatas `n_after_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_4 "Referências após eliminar duplicatas" "(n = `after_duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Referências de revisões incluídas" "(n = `reports_incluidos')" "Revisões incluídas" "(n = `incluidos_revisão')"  


			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.50 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_4 "Records after removing duplicates" "(n = `after_duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" 
			local texto_caixa_9 "Reports of included reviews" "(n = `reports_incluidos')" "Reviews included" "(n = `incluidos_revisão')"  

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.25 3 1.25 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.25 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}

	}		
	
	else if "`model'" == "overview_3" {
			
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências após a exclusão de duplicatas
		local after_duplicatas `n_after_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos awaiting classification
		local awaiting_classification `n_awaiting_classification'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_4 "Referências após eliminar duplicatas" "(n = `after_duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" "Referências aguardando" "classificação" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Referências de revisões incluídas" "(n = `reports_incluidos')" "Revisões incluídas" "(n = `incluidos_revisão')"  


			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.14 3 1.14 3.43 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.14 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_4 "Records after removing duplicates" "(n = `after_duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" "Records awaiting" "classification" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Reports of included reviews" "(n = `reports_incluidos')" "Reviews included" "(n = `incluidos_revisão')"  

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 3.15 3 `seta' ///
			|| pcarrowi 3 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.14 3 1.14 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(3.0 3 "`texto_caixa_4'" `caixa') /// caixa 4
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.14 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}

	}		

	else if "`model'" == "overview_4" {
			
		** defina o total de referências que vieram das base de dados eletrônicas
		local n_databases `n_databases'

		** defina o total de referências que vieram das base de outras fontes
		local n_othersources `n_other_sources'

		** defina o total de duplicatas
		local duplicatas `n_duplicates'

		** defina o total de referências após a exclusão de duplicatas
		local after_duplicatas `n_after_duplicates'

		** defina o total de referências avaliadas na fase 1
		local para_primeira_fase `n_first_phase'

		** defina o total de estudos excluídos na fase 1
		local excluidos_fase_um `n_excluded_first_phase'

		** defina o total de referências avaliadas na fase 2
		local para_segunda_fase `n_second_phase'

		** defina o total de estudos excluídos na fase 2
		local excluidos_fase_dois `n_excluded_second_phase'

		** defina o total de estudos awaiting classification
		local awaiting_classification `n_awaiting_classification'


		** defina o total de estudos incluidos na revisão, de publicações, ongoings e finalizados
		local incluidos_revisão `n_included_studies'
		local reports_incluidos `n_included_reports'

		** defina o total de estudos incluidos na sintese qualitativa e quantitativa
		local incluidos_sintese_qualitativa `n_included_qualitative'
		local incluidos_sintese_quantitativa `n_included_quantitative'

		if "`language'" == "pt" {
			local texto_caixa_1 "Referências identificadas" "pelas estratégias de busca" "(n = `n_databases')"
			local texto_caixa_2 "Referências identificadas" "em outras fontes" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicatas eliminadas" "(n = `duplicatas')"
			local texto_caixa_5 "Referências avaliadas pelo título/resumo" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Referências eliminadas" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Referências avaliadas em texto completo" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Referências excluídas" "com razões" "(n = `excluidos_fase_dois')" "Referências aguardando" "classificação" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Referências de revisões incluídas" "(n = `reports_incluidos')" "Revisões incluídas" "(n = `incluidos_revisão')"  


			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.49 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.47 `seta' ///
			|| pcarrowi 1.14 3 1.14 3.43 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.14 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 

		} 

		else if "`language'" == "en" {
			
			local texto_caixa_1 "Records identified" "from search strategies" "(n = `n_databases')"
			local texto_caixa_2 "Records identified" "from other sources" "(n = `n_othersources')"
			local texto_caixa_3 "Duplicates eliminated" "(n = `duplicatas')"
			local texto_caixa_5 "Records evaluated by title/abstract" "(n = `para_primeira_fase')"
			local texto_caixa_6 "Records eliminated" "(n = `excluidos_fase_um')"
			local texto_caixa_7 "Records evaluated in full-text" "(n = `para_segunda_fase')"
			local texto_caixa_8 "Records excluded" "with reasons" "(n = `excluidos_fase_dois')" "Records awaiting" "classification" "(n = `n_awaiting_classification')"
			local texto_caixa_9 "Reports of included reviews" "(n = `reports_incluidos')" "Reviews included" "(n = `incluidos_revisão')"  

			graph set window fontface "Times New Roman"

			local caixa = ", box margin(small) size(small) bcolor(bluishgray) lcolor(black)"
			local linha = ", lwidth(thin) lcolor(black)" 
			local seta = ", lwidth(thin) lcolor(black) mlcolor(black) mlwidth(thin) msize(medlarge)"


			twoway  /// 
			/// enquadramento
			pci 4.2 0 4.2 6 `linha' || pci 4.2 6 0 6 `linha' || pci 0 6 0 0 `linha' || pci 0 0 4.2 0 `linha' ///
			/// conectores verticais
			|| pcarrowi 3.8 3 2.65 3 `seta' ///
			|| pcarrowi 2.5 3 1.85 3 `seta' ///
			|| pcarrowi 1.7 3 0.63 3 `seta' ///
			/// conectores  horizontais
			|| pci 3.8 1.5 3.8 4.5 `linha' ///
			|| pcarrowi 3.35 3 3.35 3.50 `seta' ///
			|| pcarrowi 2.05 3 2.05 3.60 `seta' ///
			|| pcarrowi 1.14 3 1.14 3.65 `seta' ///
			///
			, /// adiconar texto nas caixas
			text(3.8 1.5 "`texto_caixa_1'" `caixa') /// caixa 1
			text(3.8 4.5 "`texto_caixa_2'" `caixa') /// caixa 2
			text(3.35 4.5 "`texto_caixa_3'" `caixa') /// caixa 3
			text(2.5 3 "`texto_caixa_5'" `caixa') /// caixa 5
			text(2.05 4.5 "`texto_caixa_6'" `caixa') /// caixa 6
			text(1.7 3 "`texto_caixa_7'" `caixa') /// caixa 7
			text(1.14 4.5 "`texto_caixa_8'" `caixa') /// caixa 8
			text(0.4 3 "`texto_caixa_9'" `caixa') /// caixa 9
			///
			xlabel("") ylabel("") xtitle("") ytitle("") ///
			xscale(range(0 6) noline) ///
			yscale(noline) ///
			xsize(2) ysize(3) /// 
			graphregion(color(white)) plotregion(lcolor(black)) ///
			title("") legend(off) 
		}

	}

graph export "scatter.pdf"

end
