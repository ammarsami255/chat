import 'package:intl/intl.dart';

class TimeUtils {
  /// Format timestamp for chat list
  static String formatChatTime(DateTime? timestamp) {
    if (timestamp == null) return '';
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) return 'الآن';
    if (diff.inHours < 1) return '${diff.inMinutes}د';
    if (diff.inHours < 24 && timestamp.day == now.day) {
      return DateFormat('hh:mm a').format(timestamp);
    }
    if (diff.inDays < 7) {
      // Show day name in Arabic if possible, or just days
      return '${diff.inDays}ي';
    }
    return DateFormat('dd/MM').format(timestamp);
  }

  /// Format timestamp for message bubble
  static String formatMessageTime(DateTime? timestamp) {
    if (timestamp == null) return '';
    return DateFormat('hh:mm a').format(timestamp);
  }

  /// Get last seen text
  static String getLastSeenText(DateTime? lastSeen) {
    if (lastSeen == null) return 'غير متصل';
    final now = DateTime.now();
    final diff = now.difference(lastSeen);

    if (diff.inMinutes < 1) {
      return 'نشط الآن';
    } else if (diff.inMinutes < 60) {
      return 'نشط منذ ${diff.inMinutes} دقيقة';
    } else if (diff.inHours < 24) {
      return 'نشط منذ ${diff.inHours} ساعة';
    } else if (diff.inDays == 1) {
      return 'نشط بالأمس';
    } else {
      return 'نشط منذ ${diff.inDays} يوم';
    }
  }
}
