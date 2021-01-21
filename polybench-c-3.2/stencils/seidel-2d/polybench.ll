; ModuleID = '../../utilities/polybench.c'
source_filename = "../../utilities/polybench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@polybench_papi_counters_threadid = dso_local global i32 0, align 4
@polybench_program_total_flops = dso_local global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"../../utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@polybench_t_start = dso_local global double 0.000000e+00, align 8
@polybench_t_end = dso_local global double 0.000000e+00, align 8
@.str.2 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@polybench_c_start = dso_local global i64 0, align 8
@polybench_c_end = dso_local global i64 0, align 8
@.str.3 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @polybench_flush_cache() #0 {
entry:
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  %0 = bitcast i32* %cs to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  store i32 4194560, i32* %cs, align 4, !tbaa !2
  %1 = bitcast double** %flush to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = load i32, i32* %cs, align 4, !tbaa !2
  %conv = sext i32 %2 to i64
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #5
  %3 = bitcast i8* %call to double*
  store double* %3, double** %flush, align 8, !tbaa !6
  %4 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5
  %5 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  store double 0.000000e+00, double* %tmp, align 8, !tbaa !8
  store i32 0, i32* %i, align 4, !tbaa !2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4, !tbaa !2
  %7 = load i32, i32* %cs, align 4, !tbaa !2
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load double*, double** %flush, align 8, !tbaa !6
  %9 = load i32, i32* %i, align 4, !tbaa !2
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds double, double* %8, i64 %idxprom
  %10 = load double, double* %arrayidx, align 8, !tbaa !8
  %11 = load double, double* %tmp, align 8, !tbaa !8
  %add = fadd double %11, %10
  store double %add, double* %tmp, align 8, !tbaa !8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !tbaa !2
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4, !tbaa !2
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %13 = load double, double* %tmp, align 8, !tbaa !8
  %cmp2 = fcmp ole double %13, 1.000000e+01
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  br label %if.end

if.else:                                          ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i32 96, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i64 0, i64 0)) #6
  unreachable

if.end:                                           ; preds = %if.then
  %14 = load double*, double** %flush, align 8, !tbaa !6
  %15 = bitcast double* %14 to i8*
  call void @free(i8* %15) #5
  %16 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #5
  %17 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  %18 = bitcast double** %flush to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  %19 = bitcast i32* %cs to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #5
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @polybench_prepare_instruments() #0 {
entry:
  call void @polybench_flush_cache()
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @polybench_timer_start() #0 {
entry:
  call void @polybench_prepare_instruments()
  %call = call double @rtclock()
  store double %call, double* @polybench_t_start, align 8, !tbaa !8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @polybench_timer_stop() #0 {
entry:
  %call = call double @rtclock()
  store double %call, double* @polybench_t_end, align 8, !tbaa !8
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @polybench_timer_print() #0 {
entry:
  %0 = load double, double* @polybench_t_end, align 8, !tbaa !8
  %1 = load double, double* @polybench_t_start, align 8, !tbaa !8
  %sub = fsub double %0, %1
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), double %sub)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: nounwind uwtable
define dso_local i8* @polybench_alloc_data(i64 %n, i32 %elt_size) #0 {
entry:
  %n.addr = alloca i64, align 8
  %elt_size.addr = alloca i32, align 4
  %val = alloca i64, align 8
  %ret = alloca i8*, align 8
  store i64 %n, i64* %n.addr, align 8, !tbaa !12
  store i32 %elt_size, i32* %elt_size.addr, align 4, !tbaa !2
  %0 = bitcast i64* %val to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load i64, i64* %n.addr, align 8, !tbaa !12
  store i64 %1, i64* %val, align 8, !tbaa !14
  %2 = load i32, i32* %elt_size.addr, align 4, !tbaa !2
  %conv = sext i32 %2 to i64
  %3 = load i64, i64* %val, align 8, !tbaa !14
  %mul = mul i64 %3, %conv
  store i64 %mul, i64* %val, align 8, !tbaa !14
  %4 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = load i64, i64* %val, align 8, !tbaa !14
  %call = call i8* @xmalloc(i64 %5)
  store i8* %call, i8** %ret, align 8, !tbaa !6
  %6 = load i8*, i8** %ret, align 8, !tbaa !6
  %7 = bitcast i8** %ret to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %7) #5
  %8 = bitcast i64* %val to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #5
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %num) #0 {
entry:
  %num.addr = alloca i64, align 8
  %new = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i64 %num, i64* %num.addr, align 8, !tbaa !14
  %0 = bitcast i8** %new to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  store i8* null, i8** %new, align 8, !tbaa !6
  %1 = bitcast i32* %ret to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = load i64, i64* %num.addr, align 8, !tbaa !14
  %call = call i32 @posix_memalign(i8** %new, i64 32, i64 %2) #5
  store i32 %call, i32* %ret, align 4, !tbaa !2
  %3 = load i8*, i8** %new, align 8, !tbaa !6
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32, i32* %ret, align 4, !tbaa !2
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !6
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.4, i64 0, i64 0))
  call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i8*, i8** %new, align 8, !tbaa !6
  %7 = bitcast i32* %ret to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #5
  %8 = bitcast i8** %new to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #5
  ret i8* %6
}

; Function Attrs: nounwind uwtable
define internal double @rtclock() #0 {
entry:
  %Tp = alloca %struct.timeval, align 8
  %stat = alloca i32, align 4
  %0 = bitcast %struct.timeval* %Tp to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* %0) #5
  %1 = bitcast i32* %stat to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %call = call i32 @gettimeofday(%struct.timeval* %Tp, %struct.timezone* null) #5
  store i32 %call, i32* %stat, align 4, !tbaa !2
  %2 = load i32, i32* %stat, align 4, !tbaa !2
  %cmp = icmp ne i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %stat, align 4, !tbaa !2
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 0
  %4 = load i64, i64* %tv_sec, align 8, !tbaa !16
  %conv = sitofp i64 %4 to double
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 1
  %5 = load i64, i64* %tv_usec, align 8, !tbaa !18
  %conv2 = sitofp i64 %5 to double
  %mul = fmul double %conv2, 0x3EB0C6F7A0B5ED8D
  %add = fadd double %conv, %mul
  %6 = bitcast i32* %stat to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #5
  %7 = bitcast %struct.timeval* %Tp to i8*
  call void @llvm.lifetime.end.p0i8(i64 16, i8* %7) #5
  ret double %add
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #2

; Function Attrs: nounwind
declare dso_local i32 @posix_memalign(i8**, i64, i64) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (git@github.com:bollu/llvm-project.git 7124ff502404819f179ce1c150c857d20a0b020c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !4, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long long", !4, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !4, i64 0}
!16 = !{!17, !15, i64 0}
!17 = !{!"timeval", !15, i64 0, !15, i64 8}
!18 = !{!17, !15, i64 8}
