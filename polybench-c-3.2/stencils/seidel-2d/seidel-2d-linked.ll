source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@polybench_papi_counters_threadid = dso_local global i32 0, align 4
@polybench_program_total_flops = dso_local global double 0.000000e+00, align 8
@polybench_t_start = dso_local global double 0.000000e+00, align 8
@polybench_t_end = dso_local global double 0.000000e+00, align 8
@polybench_c_start = dso_local global i64 0, align 8
@polybench_c_end = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"../../utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2.6 = private unnamed_addr constant [43 x i8] c"fp && \22unable to open file to write array\22\00", align 1
@.str.3.7 = private unnamed_addr constant [14 x i8] c"./seidel-2d.c\00", align 1
@__PRETTY_FUNCTION__.writeDouble2DArray = private unnamed_addr constant [63 x i8] c"void writeDouble2DArray(const char *, int, int, double (*)[m])\00", align 1
@.str.4.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5.9 = private unnamed_addr constant [11 x i8] c"in-cpp.bin\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"out-cpp.bin\00", align 1

define dso_local void @polybench_flush_cache() {
entry:
  %call = call noalias dereferenceable_or_null(33556480) i8* @calloc(i64 4194560, i64 8)
  %i = bitcast i8* %call to double*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %tmp.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ]
  %exitcond = icmp ne i64 %indvars.iv, 4194560
  br i1 %exitcond, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %arrayidx = getelementptr inbounds double, double* %i, i64 %indvars.iv
  %i1 = load double, double* %arrayidx, align 8, !tbaa !2
  %add = fadd double %tmp.0, %i1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %tmp.0.lcssa = phi double [ %tmp.0, %for.cond ]
  %cmp2 = fcmp ugt double %tmp.0.lcssa, 1.000000e+01
  br i1 %cmp2, label %if.else, label %if.then

if.then:                                          ; preds = %for.end
  br label %if.end

if.else:                                          ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i32 96, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0))
  unreachable

if.end:                                           ; preds = %if.then
  call void @free(i8* %call)
  ret void
}

declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture)

declare dso_local noalias i8* @calloc(i64, i64)

declare dso_local void @__assert_fail(i8*, i8*, i32, i8*)

declare dso_local void @free(i8*)

declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture)

define dso_local void @polybench_prepare_instruments() {
entry:
  call void @polybench_flush_cache()
  ret void
}

define dso_local void @polybench_timer_start() {
entry:
  call void @polybench_prepare_instruments()
  %call = call double @rtclock()
  store double %call, double* @polybench_t_start, align 8, !tbaa !2
  ret void
}

define internal double @rtclock() {
entry:
  %Tp = alloca %struct.timeval, align 8
  %i = bitcast %struct.timeval* %Tp to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %i)
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %Tp, %struct.timezone* null)
  %cmp.not = icmp eq i32 %call, 0
  br i1 %cmp.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 0
  %i1 = load i64, i64* %tv_sec, align 8, !tbaa !8
  %conv = sitofp i64 %i1 to double
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 1
  %i2 = load i64, i64* %tv_usec, align 8, !tbaa !11
  %conv2 = sitofp i64 %i2 to double
  %mul = fmul double %conv2, 0x3EB0C6F7A0B5ED8D
  %add = fadd double %mul, %conv
  %i3 = bitcast %struct.timeval* %Tp to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %i3)
  ret double %add
}

declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*)

declare dso_local i32 @printf(i8*, ...)

define dso_local void @polybench_timer_stop() {
entry:
  %call = call double @rtclock()
  store double %call, double* @polybench_t_end, align 8, !tbaa !2
  ret void
}

define dso_local void @polybench_timer_print() {
entry:
  %i = load double, double* @polybench_t_end, align 8, !tbaa !2
  %i1 = load double, double* @polybench_t_start, align 8, !tbaa !2
  %sub = fsub double %i, %i1
  %call = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), double %sub)
  ret void
}

define dso_local i8* @polybench_alloc_data(i64 %n, i32 %elt_size) {
entry:
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %conv, %n
  %call = call i8* @xmalloc(i64 %mul)
  ret i8* %call
}

define internal i8* @xmalloc(i64 %num) {
entry:
  %new = alloca i8*, align 8
  %i = bitcast i8** %new to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %i)
  store i8* null, i8** %new, align 8, !tbaa !12
  %call = call i32 @posix_memalign(i8** nonnull %new, i64 32, i64 %num)
  %i1 = load i8*, i8** %new, align 8, !tbaa !12
  %tobool.not = icmp eq i8* %i1, null
  br i1 %tobool.not, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tobool1.not = icmp eq i32 %call, 0
  br i1 %tobool1.not, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %i2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !12
  %i3 = call i64 @fwrite(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4, i64 0, i64 0), i64 50, i64 1, %struct._IO_FILE* %i2)
  call void @exit(i32 1)
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %i4 = load i8*, i8** %new, align 8, !tbaa !12
  %i5 = bitcast i8** %new to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %i5)
  ret i8* %i4
}

declare dso_local i32 @posix_memalign(i8**, i64, i64)

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...)

declare dso_local void @exit(i32)

define dso_local void @writeDouble2DArray(i8* %filename, i32 %n, i32 %m, double* %xs) {
entry:
  %len = alloca i32, align 4
  %i = zext i32 %m to i64
  %call = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0))
  %tobool.not = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool.not, label %if.else, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  br i1 true, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2.6, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3.7, i64 0, i64 0), i32 37, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.writeDouble2DArray, i64 0, i64 0))
  unreachable

if.end:                                           ; preds = %if.then
  %i6 = bitcast i32* %len to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %i6)
  %mul = mul nsw i32 %n, %m
  store i32 %mul, i32* %len, align 4, !tbaa !14
  %i7 = bitcast i32* %len to i8*
  %call1 = call i64 @fwrite(i8* nonnull %i7, i64 4, i64 1, %struct._IO_FILE* nonnull %call)
  %i8 = icmp sgt i32 %m, 0
  %smax = select i1 %i8, i32 %m, i32 0
  %i9 = icmp sgt i32 %n, 0
  %smax3 = select i1 %i9, i32 %n, i32 0
  %wide.trip.count4 = zext i32 %smax3 to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %if.end
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc9 ], [ 0, %if.end ]
  %exitcond5 = icmp ne i64 %indvars.iv1, %wide.trip.count4
  br i1 %exitcond5, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end11

for.body:                                         ; preds = %for.cond
  %wide.trip.count = zext i32 %smax to i64
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %exitcond = icmp ne i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.body5, label %for.cond.cleanup4

for.cond.cleanup4:                                ; preds = %for.cond2
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %i10 = mul nuw nsw i64 %indvars.iv1, %i
  %arrayidx = getelementptr inbounds double, double* %xs, i64 %i10
  %arrayidx7 = getelementptr inbounds double, double* %arrayidx, i64 %indvars.iv
  %i11 = bitcast double* %arrayidx7 to i8*
  %call8 = call i64 @fwrite(i8* %i11, i64 8, i64 1, %struct._IO_FILE* nonnull %call)
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond2, !llvm.loop !16

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br label %for.cond, !llvm.loop !17

for.end11:                                        ; preds = %for.cond.cleanup
  %call12 = call i32 @fclose(%struct._IO_FILE* nonnull %call)
  %i12 = bitcast i32* %len to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %i12)
  ret void
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*)

declare dso_local noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef)

declare dso_local i32 @fclose(%struct._IO_FILE*)

define dso_local i32 @main(i32 %argc, i8** %argv) {
entry:
  %call = call i8* @polybench_alloc_data(i64 16000000, i32 8)
  %arraydecay = bitcast i8* %call to [4000 x double]*
  call void @init_array(i32 4000, [4000 x double]* %arraydecay)
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %i = load i8*, i8** %argv, align 8, !tbaa !12
  %strcmpload1 = load i8, i8* %i, align 1
  %tobool.not = icmp eq i8 %strcmpload1, 0
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %i2 = bitcast i8* %call to double*
  call void @writeDouble2DArray(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5.9, i64 0, i64 0), i32 4000, i32 4000, double* %i2)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @polybench_timer_start()
  %arraydecay3 = bitcast i8* %call to [4000 x double]*
  call void @kernel_seidel_2d(i32 100, i32 4000, [4000 x double]* %arraydecay3)
  call void @polybench_timer_stop()
  call void @polybench_timer_print()
  %cmp4 = icmp sgt i32 %argc, 42
  br i1 %cmp4, label %land.lhs.true5, label %if.end11

land.lhs.true5:                                   ; preds = %if.end
  %i3 = load i8*, i8** %argv, align 8, !tbaa !12
  %strcmpload = load i8, i8* %i3, align 1
  %tobool8.not = icmp eq i8 %strcmpload, 0
  br i1 %tobool8.not, label %if.then9, label %if.end11

if.then9:                                         ; preds = %land.lhs.true5
  %i4 = bitcast i8* %call to double*
  call void @writeDouble2DArray(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 4000, i32 4000, double* %i4)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %land.lhs.true5, %if.end
  call void @free(i8* %call)
  ret i32 0
}

define internal void @init_array(i32 %n, [4000 x double]* %A) {
entry:
  %i = icmp sgt i32 %n, 0
  %smax = select i1 %i, i32 %n, i32 0
  %wide.trip.count4 = zext i32 %smax to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ 0, %entry ]
  %exitcond5 = icmp ne i64 %indvars.iv2, %wide.trip.count4
  br i1 %exitcond5, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %exitcond = icmp ne i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %i6 = trunc i64 %indvars.iv2 to i32
  %conv = sitofp i32 %i6 to double
  %i7 = add nuw nsw i64 %indvars.iv, 2
  %i8 = trunc i64 %i7 to i32
  %conv4 = sitofp i32 %i8 to double
  %mul = fmul double %conv, %conv4
  %add5 = fadd double %mul, 2.000000e+00
  %conv6 = sitofp i32 %n to double
  %div = fdiv double %add5, %conv6
  %arrayidx8 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  store double %div, double* %arrayidx8, align 8, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond1, !llvm.loop !18

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  br label %for.cond, !llvm.loop !19

for.end11:                                        ; preds = %for.cond
  ret void
}

declare dso_local i32 @strcmp(i8*, i8*)

define internal void @kernel_seidel_2d(i32 %tsteps, i32 %n, [4000 x double]* %A) {
entry:
  %i = add i32 %n, -1
  %i16 = add i32 %n, -2
  %i17 = icmp sgt i32 %i16, 0
  %smax = select i1 %i17, i32 %i16, i32 0
  %i18 = add nuw i32 %smax, 1
  %i19 = icmp sgt i32 %tsteps, 0
  %smax14 = select i1 %i19, i32 %tsteps, i32 0
  br label %for.cond

for.cond:                                         ; preds = %for.inc69, %entry
  %t.0 = phi i32 [ 0, %entry ], [ %inc70, %for.inc69 ]
  %exitcond15 = icmp ne i32 %t.0, %smax14
  br i1 %exitcond15, label %for.body, label %for.end71

for.body:                                         ; preds = %for.cond
  %wide.trip.count12 = zext i32 %i18 to i64
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc66, %for.body
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc66 ], [ 1, %for.body ]
  %exitcond13 = icmp eq i64 %indvars.iv4, %wide.trip.count12
  br i1 %exitcond13, label %for.end68, label %for.body4

for.body4:                                        ; preds = %for.cond1
  %wide.trip.count = zext i32 %i to i64
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %for.body4 ]
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.end, label %for.body8

for.body8:                                        ; preds = %for.cond5
  %i20 = add nsw i64 %indvars.iv4, -1
  %i21 = add nsw i64 %indvars.iv, -1
  %arrayidx12 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i20, i64 %i21
  %i22 = load double, double* %arrayidx12, align 8, !tbaa !2
  %i23 = add nsw i64 %indvars.iv4, -1
  %arrayidx17 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i23, i64 %indvars.iv
  %i24 = load double, double* %arrayidx17, align 8, !tbaa !2
  %add = fadd double %i22, %i24
  %i25 = add nsw i64 %indvars.iv4, -1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx23 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i25, i64 %indvars.iv.next
  %i26 = load double, double* %arrayidx23, align 8, !tbaa !2
  %add24 = fadd double %add, %i26
  %i27 = add nsw i64 %indvars.iv, -1
  %arrayidx29 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %indvars.iv4, i64 %i27
  %i28 = load double, double* %arrayidx29, align 8, !tbaa !2
  %add30 = fadd double %add24, %i28
  %arrayidx34 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %i29 = load double, double* %arrayidx34, align 8, !tbaa !2
  %add35 = fadd double %add30, %i29
  %arrayidx40 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv.next
  %i30 = load double, double* %arrayidx40, align 8, !tbaa !2
  %add41 = fadd double %add35, %i30
  %i31 = add nuw nsw i64 %indvars.iv4, 1
  %i32 = add nsw i64 %indvars.iv, -1
  %arrayidx47 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i31, i64 %i32
  %i33 = load double, double* %arrayidx47, align 8, !tbaa !2
  %add48 = fadd double %add41, %i33
  %i34 = add nuw nsw i64 %indvars.iv4, 1
  %arrayidx53 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i34, i64 %indvars.iv
  %i35 = load double, double* %arrayidx53, align 8, !tbaa !2
  %add54 = fadd double %add48, %i35
  %i36 = add nuw nsw i64 %indvars.iv4, 1
  %arrayidx60 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %i36, i64 %indvars.iv.next
  %i37 = load double, double* %arrayidx60, align 8, !tbaa !2
  %add61 = fadd double %add54, %i37
  %div = fdiv double %add61, 9.000000e+00
  %arrayidx65 = getelementptr inbounds [4000 x double], [4000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  store double %div, double* %arrayidx65, align 8, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  br label %for.cond5, !llvm.loop !20

for.end:                                          ; preds = %for.cond5
  br label %for.inc66

for.inc66:                                        ; preds = %for.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %for.cond1, !llvm.loop !21

for.end68:                                        ; preds = %for.cond1
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %inc70 = add nuw i32 %t.0, 1
  br label %for.cond, !llvm.loop !22

for.end71:                                        ; preds = %for.cond
  ret void
}


!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 12.0.0 (git@github.com:bollu/llvm-project.git 7124ff502404819f179ce1c150c857d20a0b020c)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!9, !10, i64 0}
!9 = !{!"timeval", !10, i64 0, !10, i64 8}
!10 = !{!"long", !4, i64 0}
!11 = !{!9, !10, i64 8}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !4, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !4, i64 0}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
