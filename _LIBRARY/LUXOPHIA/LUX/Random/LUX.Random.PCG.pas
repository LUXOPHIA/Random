unit LUX.Random.PCG;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     (* Representations for the oneseq, mcg, and unique variants *)

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_8

     T_pcg_state_8 = record
     private
     public
       state :Int08u;
     end;

     T_pcg8si_random_t  = T_pcg_state_8;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_16

     T_pcg_state_16 = record
     private
     public
       state :Int16u;
     end;

     T_pcg16si_random_t = T_pcg_state_16;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_32

     T_pcg_state_32 = record
     private
     public
       state :Int32u;
     end;

     T_pcg32si_random_t = T_pcg_state_32;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_64

     T_pcg_state_64 = record
     private
     public
       state :Int64u;
     end;

     T_pcg32s_random_t  = T_pcg_state_64;
     T_pcg32u_random_t  = T_pcg_state_64;
     T_pcg32f_random_t  = T_pcg_state_64;

     T_pcg64si_random_t = T_pcg_state_64;

     (* Representations setseq variants *)

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_8

     T_pcg_state_setseq_8 = record
     private
     public
       state :Int08u;
       inc   :Int08u;
     end;

     T_pcg8i_random_t = T_pcg_state_setseq_8;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_16

     T_pcg_state_setseq_16 = record
     private
     public
       state :Int16u;
       inc   :Int16u;
     end;

     T_pcg16i_random_t = T_pcg_state_setseq_16;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_32

     T_pcg_state_setseq_32 = record
     private
     public
       state :Int32u;
       inc   :Int32u;
     end;

     T_pcg32i_random_t = T_pcg_state_setseq_32;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_64

     T_pcg_state_setseq_64 = record
     private
     public
       state :Int64u;
       inc   :Int64u;
     end;

     T_pcg32_random_t  = T_pcg_state_setseq_64;

     T_pcg64i_random_t = T_pcg_state_setseq_64;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG<_TSeed_>

     IRandomPCG<_TSeed_:record> = interface( IRandom<_TSeed_> )
     ['{5794CF7C-B2C7-4E22-96CE-B30A4647EAAC}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomPCG<_TSeed_:record> = class( TRandom<_TSeed_>, IRandomPCG<_TSeed_> )
     private const
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG32basic

     TRandomPCG32basic = class( TRandomPCG<T_pcg_state_setseq_64> )
     private
       ///// メソッド
       procedure pcg32_srandom_r( var rng:T_pcg32_random_t; initstate,initseq:Int64u );
     //procedure pcg32_srandom( seed,seq:Int64u );
       function pcg32_random_r( var rng:T_pcg32_random_t ) :Int32u;
     //function pcg32_random :Int32u;
     //function pcg32_boundedrand_r( var rng:T_pcg32_random_t; bound:Int32u ) :Int32u;
     //function pcg32_boundedrand( bound:Int32u ) :Int32u;
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG_ALL

     TRandomPCG_ALL = class( TRandomPCG<T_pcg_state_setseq_64> )
     private const
       PCG_DEFAULT_MULTIPLIER_8  :Int08u = 141;
       PCG_DEFAULT_MULTIPLIER_16 :Int16u = 12829;
       PCG_DEFAULT_MULTIPLIER_32 :Int32u = 747796405;
       PCG_DEFAULT_MULTIPLIER_64 :Int64u = 6364136223846793005;
       PCG_DEFAULT_INCREMENT_8   :Int08u = 77;
       PCG_DEFAULT_INCREMENT_16  :Int16u = 47989;
       PCG_DEFAULT_INCREMENT_32  :Int32u = 2891336453;
       PCG_DEFAULT_INCREMENT_64  :Int64u = 1442695040888963407;
       (*
        * Static initialization constants (if you can't call srandom for some
        * bizarre reason).
        *)
       PCG_STATE_ONESEQ_8_INITIALIZER  :T_pcg_state_8  = ( state:$d7               );
       PCG_STATE_ONESEQ_16_INITIALIZER :T_pcg_state_16 = ( state:$20df             );
       PCG_STATE_ONESEQ_32_INITIALIZER :T_pcg_state_32 = ( state:$46b56677         );
       PCG_STATE_ONESEQ_64_INITIALIZER :T_pcg_state_64 = ( state:$4d595df4d0f33173 );
       PCG_STATE_UNIQUE_8_INITIALIZER  :T_pcg_state_8  = ( state:$d7               );  //= PCG_STATE_ONESEQ_8_INITIALIZER;
       PCG_STATE_UNIQUE_16_INITIALIZER :T_pcg_state_16 = ( state:$20df             );  //= PCG_STATE_ONESEQ_16_INITIALIZER;
       PCG_STATE_UNIQUE_32_INITIALIZER :T_pcg_state_32 = ( state:$46b56677         );  //= PCG_STATE_ONESEQ_32_INITIALIZER;
       PCG_STATE_UNIQUE_64_INITIALIZER :T_pcg_state_64 = ( state:$4d595df4d0f33173 );  //= PCG_STATE_ONESEQ_64_INITIALIZER;
       PCG_STATE_MCG_8_INITIALIZER     :T_pcg_state_8  = ( state:$e5               );
       PCG_STATE_MCG_16_INITIALIZER    :T_pcg_state_16 = ( state:$a5e5             );
       PCG_STATE_MCG_32_INITIALIZER    :T_pcg_state_32 = ( state:$d15ea5e5         );
       PCG_STATE_MCG_64_INITIALIZER    :T_pcg_state_64 = ( state:$cafef00dd15ea5e5 );
       PCG_STATE_SETSEQ_8_INITIALIZER  :T_pcg_state_setseq_8  = ( state:$9b;               inc:$db               );
       PCG_STATE_SETSEQ_16_INITIALIZER :T_pcg_state_setseq_16 = ( state:$e39b;             inc:$5bdb             );
       PCG_STATE_SETSEQ_32_INITIALIZER :T_pcg_state_setseq_32 = ( state:$ec02d89b;         inc:$94b95bdb         );
       PCG_STATE_SETSEQ_64_INITIALIZER :T_pcg_state_setseq_64 = ( state:$853c49e6748fea9b; inc:$da3e39cb94b95bdb );
       {-----}
     //PCG32_INITIALIZER   = PCG_STATE_SETSEQ_64_INITIALIZER;
     //PCG32U_INITIALIZER  = PCG_STATE_UNIQUE_64_INITIALIZER;
     //PCG32S_INITIALIZER  = PCG_STATE_ONESEQ_64_INITIALIZER;
     //PCG32F_INITIALIZER  = PCG_STATE_MCG_64_INITIALIZER;
     //PCG8SI_INITIALIZER  = PCG_STATE_ONESEQ_8_INITIALIZER;
     //PCG16SI_INITIALIZER = PCG_STATE_ONESEQ_16_INITIALIZER;
     //PCG32SI_INITIALIZER = PCG_STATE_ONESEQ_32_INITIALIZER;
     //PCG64SI_INITIALIZER = PCG_STATE_ONESEQ_64_INITIALIZER;
     //PCG8I_INITIALIZER   = PCG_STATE_SETSEQ_8_INITIALIZER;
     //PCG16I_INITIALIZER  = PCG_STATE_SETSEQ_16_INITIALIZER;
     //PCG32I_INITIALIZER  = PCG_STATE_SETSEQ_32_INITIALIZER;
     //PCG64I_INITIALIZER  = PCG_STATE_SETSEQ_64_INITIALIZER;
     private
       ///// メソッド
       // Rotate helper functions.
       function pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
       function pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
       function pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
       function pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
       // XSH RS
       function pcg_output_xsh_rs_16_8( state:Int16u ) :Int08u;
       function pcg_output_xsh_rs_32_16( state:Int32u ) :Int16u;
       function pcg_output_xsh_rs_64_32( state:Int64u ) :Int32u;
       // XSH RR
       function pcg_output_xsh_rr_16_8( state:Int16u ) :Int08u;
       function pcg_output_xsh_rr_32_16( state:Int32u ) :Int16u;
       function pcg_output_xsh_rr_64_32( state:Int64u ) :Int32u;
       // RXS M XS
       function pcg_output_rxs_m_xs_8_8( state:Int08u ) :Int08u;
       function pcg_output_rxs_m_xs_16_16( state:Int16u ) :Int16u;
       function pcg_output_rxs_m_xs_32_32( state:Int32u ) :Int32u;
       function pcg_output_rxs_m_xs_64_64( state:Int64u ) :Int64u;
       // XSL RR
       function pcg_output_xsl_rr_64_32( state:Int64u ) :Int32u;
       // XSL RR RR
       function pcg_output_xsl_rr_rr_64_64( state:Int64u ) :Int64u;
       // Functions to advance the underlying LCG
       procedure pcg_oneseq_8_step_r( var rng:T_pcg_state_8 );
       procedure pcg_oneseq_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       procedure pcg_mcg_8_step_r( var rng:T_pcg_state_8 );
       procedure pcg_mcg_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       procedure pcg_unique_8_step_r( var rng:T_pcg_state_8 );
       procedure pcg_unique_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       procedure pcg_setseq_8_step_r( var rng:T_pcg_state_setseq_8 );
       procedure pcg_setseq_8_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u );
       procedure pcg_oneseq_16_step_r( var rng:T_pcg_state_16 );
       procedure pcg_oneseq_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       procedure pcg_mcg_16_step_r( var rng:T_pcg_state_16 );
       procedure pcg_mcg_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       procedure pcg_unique_16_step_r( var rng:T_pcg_state_16 );
       procedure pcg_unique_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       procedure pcg_setseq_16_step_r( var rng:T_pcg_state_setseq_16 );
       procedure pcg_setseq_16_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u );
       procedure pcg_oneseq_32_step_r( var rng:T_pcg_state_32 );
       procedure pcg_oneseq_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       procedure pcg_mcg_32_step_r( var rng:T_pcg_state_32 );
       procedure pcg_mcg_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       procedure pcg_unique_32_step_r( var rng:T_pcg_state_32 );
       procedure pcg_unique_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       procedure pcg_setseq_32_step_r( var rng:T_pcg_state_setseq_32 );
       procedure pcg_setseq_32_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u );
       procedure pcg_oneseq_64_step_r( var rng:T_pcg_state_64 );
       procedure pcg_oneseq_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       procedure pcg_mcg_64_step_r( var rng:T_pcg_state_64 );
       procedure pcg_mcg_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       procedure pcg_unique_64_step_r( var rng:T_pcg_state_64 );
       procedure pcg_unique_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       procedure pcg_setseq_64_step_r( var rng:T_pcg_state_setseq_64 );
       procedure pcg_setseq_64_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
       { Functions to seed the RNG state }
       procedure pcg_oneseq_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       procedure pcg_mcg_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       procedure pcg_unique_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       procedure pcg_setseq_8_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u );
       procedure pcg_oneseq_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       procedure pcg_mcg_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       procedure pcg_unique_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       procedure pcg_setseq_16_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u );
       procedure pcg_oneseq_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       procedure pcg_mcg_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       procedure pcg_unique_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       procedure pcg_setseq_32_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u );
       procedure pcg_oneseq_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       procedure pcg_mcg_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       procedure pcg_unique_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       procedure pcg_setseq_64_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
       { Generation functions for XSH RS }
       function pcg_oneseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_oneseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_oneseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_oneseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_oneseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_oneseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_unique_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_unique_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_unique_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_unique_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_unique_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_unique_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_setseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
       function pcg_setseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
       function pcg_setseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
       function pcg_setseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
       function pcg_setseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       function pcg_setseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_mcg_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_mcg_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_mcg_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_mcg_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_mcg_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_mcg_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for XSH RR }
       function pcg_oneseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_oneseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_oneseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_oneseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_oneseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_oneseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_unique_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_unique_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_unique_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_unique_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_unique_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_unique_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_setseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
       function pcg_setseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
       function pcg_setseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
       function pcg_setseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
       function pcg_setseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       function pcg_setseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       { ----- }
       function pcg_mcg_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       function pcg_mcg_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       function pcg_mcg_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       function pcg_mcg_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       function pcg_mcg_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_mcg_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for RXS M XS }
       function pcg_oneseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_8 ) :Int08u;
       function pcg_oneseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u;
       function pcg_oneseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
       function pcg_oneseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
       function pcg_oneseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
       function pcg_oneseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
       function pcg_oneseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       function pcg_oneseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       { ----- }
       function pcg_unique_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
       function pcg_unique_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
       function pcg_unique_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
       function pcg_unique_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
       function pcg_unique_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       function pcg_unique_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       { ----- }
       function pcg_setseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u;
       function pcg_setseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u;
       function pcg_setseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u;
       function pcg_setseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u;
       function pcg_setseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u;
       function pcg_setseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u;
       function pcg_setseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
       function pcg_setseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
       { Generation functions for XSL RR }
       function pcg_oneseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_oneseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       function pcg_unique_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_unique_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       function pcg_setseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       function pcg_setseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       function pcg_mcg_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       function pcg_mcg_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for XSL RR RR }
       function pcg_oneseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       function pcg_oneseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       function pcg_unique_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       function pcg_unique_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       function pcg_setseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
       function pcg_setseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
     protected
       ///// メソッド
       (* Multi-step advance functions (jump-ahead, jump-back) *)
       function pcg_advance_lcg_8( state,delta,cur_mult,cur_plus:Int08u ) :Int08u;
       function pcg_advance_lcg_16( state,delta,cur_mult,cur_plus:Int16u ) :Int16u;
       function pcg_advance_lcg_32( state,delta,cur_mult,cur_plus:Int32u ) :Int32u;
       function pcg_advance_lcg_64( state,delta,cur_mult,cur_plus:Int64u ) :Int64u;
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG32basic

{ https://github.com/imneme/pcg-c-basic }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomPCG32basic.pcg32_srandom_r( var rng:T_pcg32_random_t; initstate,initseq:Int64u );
begin
     rng.state := 0;
     rng.inc   := ( initseq shl 1 ) or 1;

     pcg32_random_r( rng );

     rng.state := rng.state + initstate;

     pcg32_random_r( rng );
end;
{
procedure TRandomPCG32basic.pcg32_srandom( seed,seq:Int64u );
begin
     pcg32_srandom_r( _Seed, seed, seq );
end;
}
function TRandomPCG32basic.pcg32_random_r( var rng:T_pcg32_random_t ) :Int32u;
var
   oldstate :Int64u;
   xorshifted, rot :Int32u;
begin
     oldstate := rng.state;

     rng.state := oldstate * Int64u( 6364136223846793005 ) + rng.inc;

     xorshifted := ( ( oldstate shr 18 ) xor oldstate ) shr 27;

     rot := oldstate shr 59;

     Result := ( xorshifted shr rot ) or ( xorshifted shl ( -rot and 31 ) );
end;
{
function TRandomPCG32basic.pcg32_random :Int32u;
begin
     Result := pcg32_random_r( _Seed );
end;

function TRandomPCG32basic.pcg32_boundedrand_r( var rng:T_pcg32_random_t; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG32basic.pcg32_boundedrand( bound:Int32u ) :Int32u;
begin
     Result := pcg32_boundedrand_r( &_Seed, bound );
end;
}
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomPCG32basic.CalcNextSeed;
begin
     with _Seed do state := state * Int64u( 6364136223846793005 ) + inc;
end;

function TRandomPCG32basic.CalcRandInt32u :Int32u;
var
   xorshifted, rot :Int32u;
begin
     with _Seed do
     begin
          xorshifted := ( ( state shr 18 ) xor state ) shr 27;

          rot := state shr 59;
     end;

     Result := ( xorshifted shr rot ) or ( xorshifted shl ( -rot and 31 ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomPCG32basic.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_64;
begin
     pcg32_srandom_r( S, Random_.DrawRandInt64u, Random_.DrawRandInt64u );

     Create( S );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG_ALL

{ https://github.com/imneme/pcg-c }

{ https://github.com/imneme/pcg-c/blob/master/include/pcg_variants.h }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

(*
 * Rotate helper functions.
 *)

function TRandomPCG_ALL.pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
begin
     (* Unfortunately, clang is kinda pathetic when it comes to properly
      * recognizing idiomatic rotate code, so for clang we actually provide
      * assembler directives (enabled with PCG_USE_INLINE_ASM).  Boo, hiss.
      *)

     Result := ( value shr rot ) or ( value shl ( -rot and 07 ) );
end;

function TRandomPCG_ALL.pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 15 ) );
end;

function TRandomPCG_ALL.pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 31 ) );
end;

function TRandomPCG_ALL.pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 63 ) );
end;

(*
 * Output functions.  These are the core of the PCG generation scheme.
 *)

// XSH RS

function TRandomPCG_ALL.pcg_output_xsh_rs_16_8( state:Int16u ) :Int08u;
begin
     Result := Int08u( ( ( state shr 07 ) xor state ) shr ( ( state shr 14 ) + 03 ) );
end;

function TRandomPCG_ALL.pcg_output_xsh_rs_32_16( state:Int32u ) :Int16u;
begin
     Result := Int16u( ( ( state shr 11 ) xor state ) shr ( ( state shr 30 ) + 11 ) );
end;

function TRandomPCG_ALL.pcg_output_xsh_rs_64_32( state:Int64u ) :Int32u;
begin
     Result := Int32u( ( ( state shr 22 ) xor state ) shr ( ( state shr 61 ) + 22 ) );
end;

// XSH RR

function TRandomPCG_ALL.pcg_output_xsh_rr_16_8( state:Int16u ) :Int08u;
begin
     Result := pcg_rotr_8( ( ( state shr 05 ) xor state ) shr 05, state shr 13 );
end;

function TRandomPCG_ALL.pcg_output_xsh_rr_32_16( state:Int32u ) :Int16u;
begin
     Result := pcg_rotr_16( ( ( state shr 10 ) xor state ) shr 12, state shr 28 );
end;

function TRandomPCG_ALL.pcg_output_xsh_rr_64_32( state:Int64u ) :Int32u;
begin
     Result := pcg_rotr_32( ( ( state shr 18 ) xor state ) shr 27, state shr 59 );
end;

// RXS M XS

function TRandomPCG_ALL.pcg_output_rxs_m_xs_8_8( state:Int08u ) :Int08u;
var
   word :Int08u;
begin
     word := ( ( state shr ( ( state shr 06 ) + 2 ) ) xor state ) * 217;

     Result := ( word shr 06 ) xor word;
end;

function TRandomPCG_ALL.pcg_output_rxs_m_xs_16_16( state:Int16u ) :Int16u;
var
   word :Int16u;
begin
     word := ( ( state shr ( ( state shr 13 ) + 3 ) ) xor state ) * 62169;

     Result := ( word shr 11 ) xor word;
end;

function TRandomPCG_ALL.pcg_output_rxs_m_xs_32_32( state:Int32u ) :Int32u;
var
   word :Int32u;
begin
     word := ( ( state shr ( ( state shr 28 ) + 4 ) ) xor state ) * 277803737;

     Result := ( word shr 22 ) xor word;
end;

function TRandomPCG_ALL.pcg_output_rxs_m_xs_64_64( state:Int64u ) :Int64u;
var
   word :Int64u;
begin
     word := ( ( state shr ( ( state shr 59 ) + 5 ) ) xor state ) * 12605985483714917081;

     Result := ( word shr 43 ) xor word;
end;

// XSL RR (only defined for >= 64 bits)

function TRandomPCG_ALL.pcg_output_xsl_rr_64_32( state:Int64u ) :Int32u;
begin
     Result := pcg_rotr_32( ( Int32u( state shr 32 ) ) xor Int32u( state ), state shr 59 );
end;

// XSL RR RR (only defined for >= 64 bits)

function TRandomPCG_ALL.pcg_output_xsl_rr_rr_64_64( state:Int64u ) :Int64u;
var
   rot1, high, low, xored, newlow, newhigh :Int32u;
begin
     rot1    := Int32u( state shr 59 );
     high    := Int32u( state shr 32 );
     low     := Int32u( state        );

     xored   := high xor low;
     newlow  := pcg_rotr_32( xored, rot1 );
     newhigh := pcg_rotr_32( high, newlow and 31 );

     Result := ( Int64u( newhigh ) shl 32 ) or newlow;
end;

(* Functions to advance the underlying LCG, one version for each size and
 * each style.  These functions are considered semi-private.  There is rarely
 * a good reason to call them directly.
 *)

procedure TRandomPCG_ALL.pcg_oneseq_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + PCG_DEFAULT_INCREMENT_8;
end;

procedure TRandomPCG_ALL.pcg_oneseq_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, PCG_DEFAULT_INCREMENT_8 );
end;

procedure TRandomPCG_ALL.pcg_mcg_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8;
end;

procedure TRandomPCG_ALL.pcg_mcg_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, 0 );
end;

procedure TRandomPCG_ALL.pcg_unique_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + Int08u( rng.state or 1 );
end;

procedure TRandomPCG_ALL.pcg_unique_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, Int08u( rng.state or 1 ) );
end;

procedure TRandomPCG_ALL.pcg_setseq_8_step_r( var rng:T_pcg_state_setseq_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + rng.inc;
end;

procedure TRandomPCG_ALL.pcg_setseq_8_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, rng.inc );
end;

procedure TRandomPCG_ALL.pcg_oneseq_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + PCG_DEFAULT_INCREMENT_16;
end;

procedure TRandomPCG_ALL.pcg_oneseq_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, PCG_DEFAULT_INCREMENT_16 );
end;

procedure TRandomPCG_ALL.pcg_mcg_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16;
end;

procedure TRandomPCG_ALL.pcg_mcg_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, 0 );
end;

procedure TRandomPCG_ALL.pcg_unique_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + Int16u( rng.state or 1 );
end;

procedure TRandomPCG_ALL.pcg_unique_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, Int16u( rng.state or 1 ) );
end;

procedure TRandomPCG_ALL.pcg_setseq_16_step_r( var rng:T_pcg_state_setseq_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + rng.inc;
end;

procedure TRandomPCG_ALL.pcg_setseq_16_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, rng.inc );
end;

procedure TRandomPCG_ALL.pcg_oneseq_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + PCG_DEFAULT_INCREMENT_32;
end;

procedure TRandomPCG_ALL.pcg_oneseq_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, PCG_DEFAULT_INCREMENT_32 );
end;

procedure TRandomPCG_ALL.pcg_mcg_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32;
end;

procedure TRandomPCG_ALL.pcg_mcg_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, 0 );
end;

procedure TRandomPCG_ALL.pcg_unique_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + Int32u( rng.state or 1 );
end;

procedure TRandomPCG_ALL.pcg_unique_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, Int32u( rng.state or 1 ) );
end;

procedure TRandomPCG_ALL.pcg_setseq_32_step_r( var rng:T_pcg_state_setseq_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + rng.inc;
end;

procedure TRandomPCG_ALL.pcg_setseq_32_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, rng.inc );
end;

procedure TRandomPCG_ALL.pcg_oneseq_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + PCG_DEFAULT_INCREMENT_64;
end;

procedure TRandomPCG_ALL.pcg_oneseq_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, PCG_DEFAULT_INCREMENT_64 );
end;

procedure TRandomPCG_ALL.pcg_mcg_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64;
end;

procedure TRandomPCG_ALL.pcg_mcg_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, 0 );
end;

procedure TRandomPCG_ALL.pcg_unique_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + Int64u( rng.state or 1 );
end;

procedure TRandomPCG_ALL.pcg_unique_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, Int64u( rng.state or 1 ) );
end;

procedure TRandomPCG_ALL.pcg_setseq_64_step_r( var rng:T_pcg_state_setseq_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + rng.inc;
end;

procedure TRandomPCG_ALL.pcg_setseq_64_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, rng.inc );
end;

(* Functions to seed the RNG state, one version for each size and each
 * style.  Unlike the step functions, regular users can and should call
 * these functions.
 *)

procedure TRandomPCG_ALL.pcg_oneseq_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := 0;
     pcg_oneseq_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_8_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_mcg_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := initstate or 1;
end;

procedure TRandomPCG_ALL.pcg_unique_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := 0;
     pcg_unique_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_8_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_setseq_8_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_8_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_oneseq_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := 0;
     pcg_oneseq_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_16_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_mcg_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := initstate or 1;
end;

procedure TRandomPCG_ALL.pcg_unique_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := 0;
     pcg_unique_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_16_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_setseq_16_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_16_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_oneseq_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := 0;
     pcg_oneseq_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_32_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_mcg_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := initstate or 1;
end;

procedure TRandomPCG_ALL.pcg_unique_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := 0;
     pcg_unique_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_32_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_setseq_32_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_32_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_oneseq_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := 0;
     pcg_oneseq_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_64_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_mcg_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := initstate or 1;
end;

procedure TRandomPCG_ALL.pcg_unique_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := 0;
     pcg_unique_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_64_step_r( rng );
end;

procedure TRandomPCG_ALL.pcg_setseq_64_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_64_step_r( rng );
end;

(* Generation functions for XSH RS *)

function TRandomPCG_ALL.pcg_oneseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_unique_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_setseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_mcg_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_mcg_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_mcg_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_mcg_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_mcg_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_mcg_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSH RR

function TRandomPCG_ALL.pcg_oneseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_unique_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_setseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_mcg_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_mcg_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_mcg_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_mcg_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_mcg_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_mcg_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_mcg_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//-------------------------------------------- Generation functions for RXS M XS

function TRandomPCG_ALL.pcg_oneseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_8 ) :Int08u;
var
   oldstate :Int08u;
begin
     oldstate := rng.state;
     pcg_oneseq_8_step_r( rng );
     Result := pcg_output_rxs_m_xs_8_8( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_8_rxs_m_xs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_oneseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_unique_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

function TRandomPCG_ALL.pcg_setseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u;
var
   oldstate :Int08u;
begin
     oldstate := rng.state;
     pcg_setseq_8_step_r( rng );
     Result := pcg_output_rxs_m_xs_8_8( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_8_rxs_m_xs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSL RR

function TRandomPCG_ALL.pcg_oneseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_mcg_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

function TRandomPCG_ALL.pcg_mcg_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------- Generation functions for XSL RR RR

function TRandomPCG_ALL.pcg_oneseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_oneseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_unique_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_unique_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandomPCG_ALL.pcg_setseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

function TRandomPCG_ALL.pcg_setseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

(* Multi-step advance functions (jump-ahead, jump-back) *)

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-8.c }

function TRandomPCG_ALL.pcg_advance_lcg_8( state,delta,cur_mult,cur_plus:Int08u ) :Int08u;
var
   acc_mult, acc_plus :Int08u;
begin
     acc_mult := 1;
     acc_plus := 0;

     while delta > 0 do
     begin
          if delta and 1 <> 0 then
          begin
               acc_mult := acc_mult * cur_mult;
               acc_plus := acc_plus * cur_mult + cur_plus;
          end;

          cur_plus := ( cur_mult + 1 ) * cur_plus;
          cur_mult := cur_mult * cur_mult;

          delta := delta div 2;
     end;

     Result := acc_mult * state + acc_plus;
end;

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-16.c }

function TRandomPCG_ALL.pcg_advance_lcg_16( state,delta,cur_mult,cur_plus:Int16u ) :Int16u;
var
   acc_mult, acc_plus :Int16u;
begin
     acc_mult := 1;
     acc_plus := 0;

     while delta > 0 do
     begin
          if delta and 1 <> 0 then
          begin
               acc_mult := acc_mult * cur_mult;
               acc_plus := acc_plus * cur_mult + cur_plus;
          end;

          cur_plus := ( cur_mult + 1 ) * cur_plus;
          cur_mult := cur_mult * cur_mult;

          delta := delta div 2;
     end;

     Result := acc_mult * state + acc_plus;
end;

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-32.c }

function TRandomPCG_ALL.pcg_advance_lcg_32( state,delta,cur_mult,cur_plus:Int32u ) :Int32u;
var
   acc_mult, acc_plus :Int32u;
begin
     acc_mult := 1;
     acc_plus := 0;

     while delta > 0 do
     begin
          if delta and 1 <> 0 then
          begin
               acc_mult := acc_mult * cur_mult;
               acc_plus := acc_plus * cur_mult + cur_plus;
          end;

          cur_plus := ( cur_mult + 1 ) * cur_plus;
          cur_mult := cur_mult * cur_mult;

          delta := delta div 2;
     end;

     Result := acc_mult * state + acc_plus;
end;

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-64.c }

function TRandomPCG_ALL.pcg_advance_lcg_64( state,delta,cur_mult,cur_plus:Int64u ) :Int64u;
var
   acc_mult, acc_plus :Int64u;
begin
     acc_mult := 1;
     acc_plus := 0;

     while delta > 0 do
     begin
          if delta and 1 <> 0 then
          begin
               acc_mult := acc_mult * cur_mult;
               acc_plus := acc_plus * cur_mult + cur_plus;
          end;

          cur_plus := ( cur_mult + 1 ) * cur_plus;
          cur_mult := cur_mult * cur_mult;

          delta := delta div 2;
     end;

     Result := acc_mult * state + acc_plus;
end;

//------------------------------------------------------------------------------

procedure TRandomPCG_ALL.CalcNextSeed;
begin
     pcg_setseq_64_step_r( _Seed );
end;

function TRandomPCG_ALL.CalcRandInt32u :Int32u;
begin
     Result := pcg_output_xsh_rr_64_32( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomPCG_ALL.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_64;
begin
     pcg_setseq_64_srandom_r( S, Random_.DrawRandInt64u, Random_.DrawRandInt64u );

     Create( S );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■