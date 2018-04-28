function svm_predict_matlab(a)
    if not(libisloaded('libthundersvm'))
        if ispc
            loadlibrary('../build/bin/Debug/thundersvm.dll', '../include/thundersvm/svm_matlab_interface.h')
        elseif isunix
            loadlibrary('../build/lib/libthundersvm.so', '../include/thundersvm/svm_matlab_interface.h')
        elseif ismac
            loadlibrary('../build/lib/libthundersvm.dylib', '../include/thundersvm/svm_matlab_interface.h')
        else
            disp 'OS not supported!'
        end
    end
	str = {'thundersvm-predict'}
	str2 = [str a]
	calllib('libthundersvm', 'thundersvm_predict_matlab', length(str2), str2)
end