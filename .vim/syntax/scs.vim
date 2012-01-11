" Vim syntax file
" Language: SearchCraft Spec
" Author: Jangwon Seo <safer@nhncorp.com>
"		  Ji Yong Jung <ways@nhncorp.com>
"		  Jae Hoon Kim <kisow@nhncorp.com>
" Last Change: May, 2, 2008

" Setup {{{
" React to possibly already-defined syntax.
" For version 5.x: Clear all syntax items unconditionally
" For version 6.x: Quit when a syntax file was already loaded
"if version >= 600
"  if exists("b:current_syntax")
"    finish
"  endif
"else
"  syntax clear
"endif
syntax clear

" }}}
" Base constructs {{{
" syn match scsComment "^\s*#.*$" contains=scsFixme
syn match scsAnything "\s[^>]*" contained
syn match scsError "\w\+" contained

" Define Folding..
syn region scsBlock start=/{/ end=/}/ transparent fold
syn region scsFunction start=/(/ end=/)/ transparent fold

syn region scsComment start="#" skip="\\$" end="$"
syn region scsString start=+"+ end=+"+ skip=+\\\\\|\\\"+
" }}}
" Core {{{
syn keyword scsBoolflag enable disable 
" preprocessor
syn keyword scsInclude include dictionary stopword define enddef loglevel ifenvdef else endif plugin
" structs
syn keyword scsDeclaration SRCHLOGIC LEVEL CYCLE TARGETMAP TARGET DOC
syn keyword scsCondition QUERY_ASSERT PREP_QUERY_ASSERT BRANCH DOC_PARAM SEARCH_PARAM  
syn keyword scsMethod GET_DOCPROP QUERY_PREPROCESS SUMMARY QUERY INTERSECTION_QUERY EXCLUSION_QUERY RESULT_POSTPROCESS DOC_SECTION 

" targetmap
" syn keyword scsDeclarationDetail nxp_client_conf connect_timeout retry_delay
syn keyword scsDeclarationDetail NxpClientConf ConnectTimeout RetryDelay

" srchlogic / cycle / level
" syn keyword scsDeclarationDetail language service_mode retry_cnt search_target read_target use_diehard use_sorthard transfer_timeout summary_only
syn keyword scsDeclarationDetail Language ServiceMode RetryCnt SearchTarget ReadTarget UseDiehard UseSorthard TransferTimeout SummaryOnly
" syn keyword scsDeclarationDetail display_cnt surplus_cnt employer_docprop_no employee_docprop_no display_cnt_per_employer use_multi_remove_dup
syn keyword scsDeclarationDetail DisplayCnt SurplusCnt EmployerDocPropNo EmployeeDocPropNo DisplayCntPerEmployer UseMultiRemoveDup
" syn keyword scsDeclarationDetail result_aggr_uint8docprop_no result_aggr_uint16docprop_no result_aggr_uint32docprop_no result_aggr_uint64docprop_no 
syn keyword scsDeclarationDetail ResultAggrUInt8DocPropNo ResultAggrUInt16DocPropNo ResultAggrUInt32DocPropNo ResultAggrUInt64DocPropNo 
" syn keyword scsMethodOption get_uint8docprop get_uint16docprop get_uint32docprop get_uint64docprop get_floatdocprop get_muint32docprop get_mstrdocprop
syn keyword scsMethodOption GetUInt8DocProp GetUInt16DocProp GetUInt32DocProp GetUInt64DocProp GetFloatDocProp GetMUInt32DocProp GetMStrDocProp

" methods
" syn keyword scsMethodOption method parameter query_index intersection_query_index exclusion_query_index grouping_docprop aggregation_method aggregation_parameter
syn keyword scsMethodOption Method Parameter QueryIndex IntersectionQueryIndex ExclusionQueryIndex GroupingDocProp AggregationMethod AggregationParameter

" queryparam
" syn keyword scsMethodOption index_name query_process_type query_process_option weight_evaluation term_extractor phrase_term_extractor passage_term_option
syn keyword scsMethodOption IndexName QueryProcessType QueryProcessOption WeightEvaluation TermExtractor PhraseTermExtractor ProxrankTermExtractor PassageTermOption
" syn keyword scsMethodOption bool_index_name bool_query_process_type bool_query_process_option bool_weight_evaluation bool_term_extractor bool_phrase_term_extractor bool_passage_term_option
syn keyword scsMethodOption BoolIndexName BoolQueryProcessType BoolQueryProcessOption BoolWeightEvaluation BoolTermExtractor BoolPhraseTermExtractor BoolPassageTermOption

" srchparam
" syn keyword scsMethodOption cycle_timeout nxp_top_k cache_exec_option cache_key_prefix
syn keyword scsMethodOption CycleTimeout NxpTopK CacheExecOption CacheKeyPrefix
" syn keyword scsMethodOption sort_option how_many_results use_total_cnt_sync docstat_scope return_target
syn keyword scsMethodOption SortOption HowManyResults UseTotalCntSync DocStatScope ReturnTarget
" syn keyword scsMethodOption similarity_evaluation quality_evaluation relevance_evaluation
syn keyword scsMethodOption SimilarityEvaluation QualityEvaluation RelevanceEvaluation

" doc_param
" syn keyword scsMethodOption use_nxp_swaptbl nxp_swaptbl_name ignore_index_term
syn keyword scsMethodOption UseNxpSwapTbl NxpSwapTblName IgnoreIndexTerm

" doc_section
" syn keyword scsMethodOption section_name max_length use_passage passage_option max_sub_passage
syn keyword scsMethodOption SectionName MaxLength UsePassage PassageOption MaxSubPassage

" branch
" syn keyword scsConditionAction rule_out_negative_relevance  scope_merge_client merge bypass clear goto exit
syn keyword scsConditionAction RuleOutNegativeRelevance SubsetScopeMerge ScopeMerge ScopeMergeClient Merge Bypass Clear Goto Exit

" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scs_syntax_inits")
  if version < 508
    let did_scs_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

"  HiLink scsReservedCycle       String
  HiLink scsConditionOP         scsInclude
  HiLink scsMethodOption        scsDeclarationDetail
  HiLink scsMethod              PreProc
  HiLink scsConditionAction     Function
  HiLink scsCondition           SpecialChar
  HiLink scsComment             Comment
  HiLink scsInclude             Include
  HiLink scsDeclarationDetail   Type
  HiLink scsDeclaration         Label
  HiLink scsError               Error
  HiLink scsString				String
  HiLink scsBoolflag			String
  HiLink scsAnything            Special

  delcommand HiLink
endif
" }}}
let b:current_syntax = "scs"
