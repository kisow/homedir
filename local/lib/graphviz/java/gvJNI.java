package org.graphviz;

/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version: 1.3.21
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */


class gvJNI {
  public final static native long graph__SWIG_0(String jarg1);
  public final static native long digraph(String jarg1);
  public final static native long strictgraph(String jarg1);
  public final static native long strictdigraph(String jarg1);
  public final static native long readstring(String jarg1);
  public final static native long read__SWIG_0(String jarg1);
  public final static native long read__SWIG_1(long jarg1);
  public final static native long graph__SWIG_1(long jarg1, String jarg2);
  public final static native long node(long jarg1, String jarg2);
  public final static native long edge__SWIG_0(long jarg1, long jarg2);
  public final static native long edge__SWIG_1(long jarg1, String jarg2);
  public final static native long edge__SWIG_2(String jarg1, long jarg2);
  public final static native long edge__SWIG_3(long jarg1, String jarg2, String jarg3);
  public final static native String setv__SWIG_0(long jarg1, String jarg2, String jarg3);
  public final static native String setv__SWIG_1(long jarg1, String jarg2, String jarg3);
  public final static native String setv__SWIG_2(long jarg1, String jarg2, String jarg3);
  public final static native String setv__SWIG_3(long jarg1, long jarg2, String jarg3);
  public final static native String setv__SWIG_4(long jarg1, long jarg2, String jarg3);
  public final static native String setv__SWIG_5(long jarg1, long jarg2, String jarg3);
  public final static native String getv__SWIG_0(long jarg1, String jarg2);
  public final static native String getv__SWIG_1(long jarg1, String jarg2);
  public final static native String getv__SWIG_2(long jarg1, String jarg2);
  public final static native String getv__SWIG_3(long jarg1, long jarg2);
  public final static native String getv__SWIG_4(long jarg1, long jarg2);
  public final static native String getv__SWIG_5(long jarg1, long jarg2);
  public final static native String nameof__SWIG_0(long jarg1);
  public final static native String nameof__SWIG_1(long jarg1);
  public final static native String nameof__SWIG_2(long jarg1);
  public final static native long findsubg(long jarg1, String jarg2);
  public final static native long findnode(long jarg1, String jarg2);
  public final static native long findedge(long jarg1, long jarg2);
  public final static native long findattr__SWIG_0(long jarg1, String jarg2);
  public final static native long findattr__SWIG_1(long jarg1, String jarg2);
  public final static native long findattr__SWIG_2(long jarg1, String jarg2);
  public final static native long headof(long jarg1);
  public final static native long tailof(long jarg1);
  public final static native long graphof__SWIG_0(long jarg1);
  public final static native long graphof__SWIG_1(long jarg1);
  public final static native long graphof__SWIG_2(long jarg1);
  public final static native long rootof(long jarg1);
  public final static native long protonode(long jarg1);
  public final static native long protoedge(long jarg1);
  public final static native boolean ok__SWIG_0(long jarg1);
  public final static native boolean ok__SWIG_1(long jarg1);
  public final static native boolean ok__SWIG_2(long jarg1);
  public final static native boolean ok__SWIG_3(long jarg1);
  public final static native long firstsubg(long jarg1);
  public final static native long nextsubg(long jarg1, long jarg2);
  public final static native long firstsupg(long jarg1);
  public final static native long nextsupg(long jarg1, long jarg2);
  public final static native long firstedge__SWIG_0(long jarg1);
  public final static native long nextedge__SWIG_0(long jarg1, long jarg2);
  public final static native long firstout__SWIG_0(long jarg1);
  public final static native long nextout__SWIG_0(long jarg1, long jarg2);
  public final static native long firstedge__SWIG_1(long jarg1);
  public final static native long nextedge__SWIG_1(long jarg1, long jarg2);
  public final static native long firstout__SWIG_1(long jarg1);
  public final static native long nextout__SWIG_1(long jarg1, long jarg2);
  public final static native long firsthead(long jarg1);
  public final static native long nexthead(long jarg1, long jarg2);
  public final static native long firstin__SWIG_0(long jarg1);
  public final static native long nextin__SWIG_0(long jarg1, long jarg2);
  public final static native long firstin__SWIG_1(long jarg1);
  public final static native long nextin__SWIG_1(long jarg1, long jarg2);
  public final static native long firsttail(long jarg1);
  public final static native long nexttail(long jarg1, long jarg2);
  public final static native long firstnode__SWIG_0(long jarg1);
  public final static native long nextnode__SWIG_0(long jarg1, long jarg2);
  public final static native long firstnode__SWIG_1(long jarg1);
  public final static native long nextnode__SWIG_1(long jarg1, long jarg2);
  public final static native long firstattr__SWIG_0(long jarg1);
  public final static native long nextattr__SWIG_0(long jarg1, long jarg2);
  public final static native long firstattr__SWIG_1(long jarg1);
  public final static native long nextattr__SWIG_1(long jarg1, long jarg2);
  public final static native long firstattr__SWIG_2(long jarg1);
  public final static native long nextattr__SWIG_2(long jarg1, long jarg2);
  public final static native boolean rm__SWIG_0(long jarg1);
  public final static native boolean rm__SWIG_1(long jarg1);
  public final static native boolean rm__SWIG_2(long jarg1);
  public final static native boolean layout(long jarg1, String jarg2);
  public final static native boolean render__SWIG_0(long jarg1);
  public final static native boolean render__SWIG_1(long jarg1, String jarg2);
  public final static native boolean render__SWIG_2(long jarg1, String jarg2, long jarg3);
  public final static native boolean render__SWIG_3(long jarg1, String jarg2, String jarg3);
  public final static native boolean renderchannel(long jarg1, String jarg2, String jarg3);
  public final static native void renderresult(long jarg1, String jarg2, String jarg3);
  public final static native String renderdata(long jarg1, String jarg2);
  public final static native boolean write__SWIG_0(long jarg1, String jarg2);
  public final static native boolean write__SWIG_1(long jarg1, long jarg2);
}
