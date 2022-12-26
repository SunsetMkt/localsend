import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localsend_app/model/dto/file_dto.dart';
import 'package:localsend_app/model/file_status.dart';

part 'receiving_file.freezed.dart';

@freezed
class ReceivingFile with _$ReceivingFile {
  const factory ReceivingFile({
    required FileDto file,
    required FileStatus status,
    required String? token,
    required String? tempPath, // file is saved to a temporary path first
  }) = _ReceivingFile;
}
