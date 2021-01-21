; ModuleID = './seidel-2d.c'
source_filename = "./seidel-2d.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"unable to open file to write array\00", align 1
@.str.2 = private unnamed_addr constant [43 x i8] c"fp && \22unable to open file to write array\22\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"./seidel-2d.c\00", align 1
@__PRETTY_FUNCTION__.writeDouble2DArray = private unnamed_addr constant [63 x i8] c"void writeDouble2DArray(const char *, int, int, double (*)[m])\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"in-cpp.bin\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"out-cpp.bin\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @writeDouble2DArray(i8* %filename, i32 %n, i32 %m, double* %xs) #0 {
entry:
  %filename.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %xs.addr = alloca double*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %len = alloca i32, align 4
  %i = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 8, !tbaa !2
  store i32 %n, i32* %n.addr, align 4, !tbaa !6
  store i32 %m, i32* %m.addr, align 4, !tbaa !6
  store double* %xs, double** %xs.addr, align 8, !tbaa !2
  %0 = load i32, i32* %n.addr, align 4, !tbaa !6
  %1 = zext i32 %0 to i64
  %2 = load i32, i32* %m.addr, align 4, !tbaa !6
  %3 = zext i32 %2 to i64
  %4 = bitcast %struct._IO_FILE** %fp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = load i8*, i8** %filename.addr, align 8, !tbaa !2
  %call = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !tbaa !2
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !tbaa !2
  %tobool = icmp ne %struct._IO_FILE* %6, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  br i1 true, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 37, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.writeDouble2DArray, i64 0, i64 0)) #7
  unreachable

if.end:                                           ; preds = %if.then
  %7 = bitcast i32* %len to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #6
  %8 = load i32, i32* %n.addr, align 4, !tbaa !6
  %9 = load i32, i32* %m.addr, align 4, !tbaa !6
  %mul = mul nsw i32 %8, %9
  store i32 %mul, i32* %len, align 4, !tbaa !6
  %10 = bitcast i32* %len to i8*
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !tbaa !2
  %call1 = call i64 @fwrite(i8* %10, i64 4, i64 1, %struct._IO_FILE* %11)
  %12 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #6
  store i32 0, i32* %i, align 4, !tbaa !6
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %if.end
  %13 = load i32, i32* %i, align 4, !tbaa !6
  %14 = load i32, i32* %n.addr, align 4, !tbaa !6
  %cmp = icmp slt i32 %13, %14
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 2, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #6
  br label %for.end11

for.body:                                         ; preds = %for.cond
  %16 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #6
  store i32 0, i32* %j, align 4, !tbaa !6
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %17 = load i32, i32* %j, align 4, !tbaa !6
  %18 = load i32, i32* %m.addr, align 4, !tbaa !6
  %cmp3 = icmp slt i32 %17, %18
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 5, i32* %cleanup.dest.slot, align 4
  %19 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #6
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %20 = load double*, double** %xs.addr, align 8, !tbaa !2
  %21 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom = sext i32 %21 to i64
  %22 = mul nsw i64 %idxprom, %3
  %arrayidx = getelementptr inbounds double, double* %20, i64 %22
  %23 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom6 = sext i32 %23 to i64
  %arrayidx7 = getelementptr inbounds double, double* %arrayidx, i64 %idxprom6
  %24 = bitcast double* %arrayidx7 to i8*
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !tbaa !2
  %call8 = call i64 @fwrite(i8* %24, i64 8, i64 1, %struct._IO_FILE* %25)
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %26 = load i32, i32* %j, align 4, !tbaa !6
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %j, align 4, !tbaa !6
  br label %for.cond2, !llvm.loop !8

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %27 = load i32, i32* %i, align 4, !tbaa !6
  %inc10 = add nsw i32 %27, 1
  store i32 %inc10, i32* %i, align 4, !tbaa !6
  br label %for.cond, !llvm.loop !10

for.end11:                                        ; preds = %for.cond.cleanup
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !tbaa !2
  %call12 = call i32 @fclose(%struct._IO_FILE* %28)
  %29 = bitcast i32* %len to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #6
  %30 = bitcast %struct._IO_FILE** %fp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #6
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %tsteps = alloca i32, align 4
  %A = alloca [4000 x [4000 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !6
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !2
  %0 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  store i32 4000, i32* %n, align 4, !tbaa !6
  %1 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6
  store i32 100, i32* %tsteps, align 4, !tbaa !6
  %2 = bitcast [4000 x [4000 x double]]** %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6
  %call = call i8* @polybench_alloc_data(i64 16000000, i32 8)
  %3 = bitcast i8* %call to [4000 x [4000 x double]]*
  store [4000 x [4000 x double]]* %3, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %4 = load i32, i32* %n, align 4, !tbaa !6
  %5 = load [4000 x [4000 x double]]*, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %arraydecay = getelementptr inbounds [4000 x [4000 x double]], [4000 x [4000 x double]]* %5, i64 0, i64 0
  call void @init_array(i32 %4, [4000 x double]* %arraydecay)
  %6 = load i32, i32* %argc.addr, align 4, !tbaa !6
  %cmp = icmp sgt i32 %6, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8**, i8*** %argv.addr, align 8, !tbaa !2
  %arrayidx = getelementptr inbounds i8*, i8** %7, i64 0
  %8 = load i8*, i8** %arrayidx, align 8, !tbaa !2
  %call1 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i64 0, i64 0)) #8
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %n, align 4, !tbaa !6
  %10 = load i32, i32* %n, align 4, !tbaa !6
  %11 = load [4000 x [4000 x double]]*, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %arraydecay2 = getelementptr inbounds [4000 x [4000 x double]], [4000 x [4000 x double]]* %11, i64 0, i64 0
  %12 = bitcast [4000 x double]* %arraydecay2 to double*
  call void @writeDouble2DArray(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i32 %9, i32 %10, double* %12)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void (...) @polybench_timer_start()
  %13 = load i32, i32* %tsteps, align 4, !tbaa !6
  %14 = load i32, i32* %n, align 4, !tbaa !6
  %15 = load [4000 x [4000 x double]]*, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %arraydecay3 = getelementptr inbounds [4000 x [4000 x double]], [4000 x [4000 x double]]* %15, i64 0, i64 0
  call void @kernel_seidel_2d(i32 %13, i32 %14, [4000 x double]* %arraydecay3)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %16 = load i32, i32* %argc.addr, align 4, !tbaa !6
  %cmp4 = icmp sgt i32 %16, 42
  br i1 %cmp4, label %land.lhs.true5, label %if.end11

land.lhs.true5:                                   ; preds = %if.end
  %17 = load i8**, i8*** %argv.addr, align 8, !tbaa !2
  %arrayidx6 = getelementptr inbounds i8*, i8** %17, i64 0
  %18 = load i8*, i8** %arrayidx6, align 8, !tbaa !2
  %call7 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i64 0, i64 0)) #8
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %land.lhs.true5
  %19 = load i32, i32* %n, align 4, !tbaa !6
  %20 = load i32, i32* %n, align 4, !tbaa !6
  %21 = load [4000 x [4000 x double]]*, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %arraydecay10 = getelementptr inbounds [4000 x [4000 x double]], [4000 x [4000 x double]]* %21, i64 0, i64 0
  %22 = bitcast [4000 x double]* %arraydecay10 to double*
  call void @writeDouble2DArray(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 %19, i32 %20, double* %22)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %land.lhs.true5, %if.end
  %23 = load [4000 x [4000 x double]]*, [4000 x [4000 x double]]** %A, align 8, !tbaa !2
  %24 = bitcast [4000 x [4000 x double]]* %23 to i8*
  call void @free(i8* %24) #6
  %25 = bitcast [4000 x [4000 x double]]** %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #6
  %26 = bitcast i32* %tsteps to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #6
  %27 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #6
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: nounwind uwtable
define internal void @init_array(i32 %n, [4000 x double]* %A) #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4, !tbaa !6
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8, !tbaa !2
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6
  store i32 0, i32* %i, align 4, !tbaa !6
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %2 = load i32, i32* %i, align 4, !tbaa !6
  %3 = load i32, i32* %n.addr, align 4, !tbaa !6
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !tbaa !6
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !tbaa !6
  %5 = load i32, i32* %n.addr, align 4, !tbaa !6
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4, !tbaa !6
  %conv = sitofp i32 %6 to double
  %7 = load i32, i32* %j, align 4, !tbaa !6
  %add = add nsw i32 %7, 2
  %conv4 = sitofp i32 %add to double
  %mul = fmul double %conv, %conv4
  %add5 = fadd double %mul, 2.000000e+00
  %8 = load i32, i32* %n.addr, align 4, !tbaa !6
  %conv6 = sitofp i32 %8 to double
  %div = fdiv double %add5, %conv6
  %9 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %10 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [4000 x double], [4000 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx, i64 0, i64 %idxprom7
  store double %div, double* %arrayidx8, align 8, !tbaa !11
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %j, align 4, !tbaa !6
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4, !tbaa !6
  br label %for.cond1, !llvm.loop !13

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !tbaa !6
  %inc10 = add nsw i32 %13, 1
  store i32 %inc10, i32* %i, align 4, !tbaa !6
  br label %for.cond, !llvm.loop !14

for.end11:                                        ; preds = %for.cond
  %14 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #6
  %15 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #6
  ret void
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

declare dso_local void @polybench_timer_start(...) #2

; Function Attrs: nounwind uwtable
define internal void @kernel_seidel_2d(i32 %tsteps, i32 %n, [4000 x double]* %A) #0 {
entry:
  %tsteps.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [4000 x double]*, align 8
  %t = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %tsteps, i32* %tsteps.addr, align 4, !tbaa !6
  store i32 %n, i32* %n.addr, align 4, !tbaa !6
  store [4000 x double]* %A, [4000 x double]** %A.addr, align 8, !tbaa !2
  %0 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6
  store i32 0, i32* %t, align 4, !tbaa !6
  br label %for.cond

for.cond:                                         ; preds = %for.inc69, %entry
  %3 = load i32, i32* %t, align 4, !tbaa !6
  %4 = load i32, i32* %tsteps.addr, align 4, !tbaa !6
  %sub = sub nsw i32 %4, 1
  %cmp = icmp sle i32 %3, %sub
  br i1 %cmp, label %for.body, label %for.end71

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %i, align 4, !tbaa !6
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc66, %for.body
  %5 = load i32, i32* %i, align 4, !tbaa !6
  %6 = load i32, i32* %n.addr, align 4, !tbaa !6
  %sub2 = sub nsw i32 %6, 2
  %cmp3 = icmp sle i32 %5, %sub2
  br i1 %cmp3, label %for.body4, label %for.end68

for.body4:                                        ; preds = %for.cond1
  store i32 1, i32* %j, align 4, !tbaa !6
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %7 = load i32, i32* %j, align 4, !tbaa !6
  %8 = load i32, i32* %n.addr, align 4, !tbaa !6
  %sub6 = sub nsw i32 %8, 2
  %cmp7 = icmp sle i32 %7, %sub6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %9 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %10 = load i32, i32* %i, align 4, !tbaa !6
  %sub9 = sub nsw i32 %10, 1
  %idxprom = sext i32 %sub9 to i64
  %arrayidx = getelementptr inbounds [4000 x double], [4000 x double]* %9, i64 %idxprom
  %11 = load i32, i32* %j, align 4, !tbaa !6
  %sub10 = sub nsw i32 %11, 1
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx, i64 0, i64 %idxprom11
  %12 = load double, double* %arrayidx12, align 8, !tbaa !11
  %13 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %14 = load i32, i32* %i, align 4, !tbaa !6
  %sub13 = sub nsw i32 %14, 1
  %idxprom14 = sext i32 %sub13 to i64
  %arrayidx15 = getelementptr inbounds [4000 x double], [4000 x double]* %13, i64 %idxprom14
  %15 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom16 = sext i32 %15 to i64
  %arrayidx17 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx15, i64 0, i64 %idxprom16
  %16 = load double, double* %arrayidx17, align 8, !tbaa !11
  %add = fadd double %12, %16
  %17 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %18 = load i32, i32* %i, align 4, !tbaa !6
  %sub18 = sub nsw i32 %18, 1
  %idxprom19 = sext i32 %sub18 to i64
  %arrayidx20 = getelementptr inbounds [4000 x double], [4000 x double]* %17, i64 %idxprom19
  %19 = load i32, i32* %j, align 4, !tbaa !6
  %add21 = add nsw i32 %19, 1
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx20, i64 0, i64 %idxprom22
  %20 = load double, double* %arrayidx23, align 8, !tbaa !11
  %add24 = fadd double %add, %20
  %21 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %22 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom25 = sext i32 %22 to i64
  %arrayidx26 = getelementptr inbounds [4000 x double], [4000 x double]* %21, i64 %idxprom25
  %23 = load i32, i32* %j, align 4, !tbaa !6
  %sub27 = sub nsw i32 %23, 1
  %idxprom28 = sext i32 %sub27 to i64
  %arrayidx29 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx26, i64 0, i64 %idxprom28
  %24 = load double, double* %arrayidx29, align 8, !tbaa !11
  %add30 = fadd double %add24, %24
  %25 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %26 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom31 = sext i32 %26 to i64
  %arrayidx32 = getelementptr inbounds [4000 x double], [4000 x double]* %25, i64 %idxprom31
  %27 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom33 = sext i32 %27 to i64
  %arrayidx34 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx32, i64 0, i64 %idxprom33
  %28 = load double, double* %arrayidx34, align 8, !tbaa !11
  %add35 = fadd double %add30, %28
  %29 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %30 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom36 = sext i32 %30 to i64
  %arrayidx37 = getelementptr inbounds [4000 x double], [4000 x double]* %29, i64 %idxprom36
  %31 = load i32, i32* %j, align 4, !tbaa !6
  %add38 = add nsw i32 %31, 1
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx37, i64 0, i64 %idxprom39
  %32 = load double, double* %arrayidx40, align 8, !tbaa !11
  %add41 = fadd double %add35, %32
  %33 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %34 = load i32, i32* %i, align 4, !tbaa !6
  %add42 = add nsw i32 %34, 1
  %idxprom43 = sext i32 %add42 to i64
  %arrayidx44 = getelementptr inbounds [4000 x double], [4000 x double]* %33, i64 %idxprom43
  %35 = load i32, i32* %j, align 4, !tbaa !6
  %sub45 = sub nsw i32 %35, 1
  %idxprom46 = sext i32 %sub45 to i64
  %arrayidx47 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx44, i64 0, i64 %idxprom46
  %36 = load double, double* %arrayidx47, align 8, !tbaa !11
  %add48 = fadd double %add41, %36
  %37 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %38 = load i32, i32* %i, align 4, !tbaa !6
  %add49 = add nsw i32 %38, 1
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds [4000 x double], [4000 x double]* %37, i64 %idxprom50
  %39 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom52 = sext i32 %39 to i64
  %arrayidx53 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx51, i64 0, i64 %idxprom52
  %40 = load double, double* %arrayidx53, align 8, !tbaa !11
  %add54 = fadd double %add48, %40
  %41 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %42 = load i32, i32* %i, align 4, !tbaa !6
  %add55 = add nsw i32 %42, 1
  %idxprom56 = sext i32 %add55 to i64
  %arrayidx57 = getelementptr inbounds [4000 x double], [4000 x double]* %41, i64 %idxprom56
  %43 = load i32, i32* %j, align 4, !tbaa !6
  %add58 = add nsw i32 %43, 1
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx57, i64 0, i64 %idxprom59
  %44 = load double, double* %arrayidx60, align 8, !tbaa !11
  %add61 = fadd double %add54, %44
  %div = fdiv double %add61, 9.000000e+00
  %45 = load [4000 x double]*, [4000 x double]** %A.addr, align 8, !tbaa !2
  %46 = load i32, i32* %i, align 4, !tbaa !6
  %idxprom62 = sext i32 %46 to i64
  %arrayidx63 = getelementptr inbounds [4000 x double], [4000 x double]* %45, i64 %idxprom62
  %47 = load i32, i32* %j, align 4, !tbaa !6
  %idxprom64 = sext i32 %47 to i64
  %arrayidx65 = getelementptr inbounds [4000 x double], [4000 x double]* %arrayidx63, i64 0, i64 %idxprom64
  store double %div, double* %arrayidx65, align 8, !tbaa !11
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %48 = load i32, i32* %j, align 4, !tbaa !6
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* %j, align 4, !tbaa !6
  br label %for.cond5, !llvm.loop !15

for.end:                                          ; preds = %for.cond5
  br label %for.inc66

for.inc66:                                        ; preds = %for.end
  %49 = load i32, i32* %i, align 4, !tbaa !6
  %inc67 = add nsw i32 %49, 1
  store i32 %inc67, i32* %i, align 4, !tbaa !6
  br label %for.cond1, !llvm.loop !16

for.end68:                                        ; preds = %for.cond1
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %50 = load i32, i32* %t, align 4, !tbaa !6
  %inc70 = add nsw i32 %50, 1
  store i32 %inc70, i32* %t, align 4, !tbaa !6
  br label %for.cond, !llvm.loop !17

for.end71:                                        ; preds = %for.cond
  %51 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %51) #6
  %52 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %52) #6
  %53 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #6
  ret void
}

declare dso_local void @polybench_timer_stop(...) #2

declare dso_local void @polybench_timer_print(...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (git@github.com:bollu/llvm-project.git 7124ff502404819f179ce1c150c857d20a0b020c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !4, i64 0}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
