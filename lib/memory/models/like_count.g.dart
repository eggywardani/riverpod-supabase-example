// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_count.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$likeCountHash() => r'8519580832bfa19ff36c5ac4575cd6e0aaa0edaa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [likeCount].
@ProviderFor(likeCount)
const likeCountProvider = LikeCountFamily();

/// See also [likeCount].
class LikeCountFamily extends Family<AsyncValue<LikeInfo>> {
  /// See also [likeCount].
  const LikeCountFamily();

  /// See also [likeCount].
  LikeCountProvider call(
    Memory data,
  ) {
    return LikeCountProvider(
      data,
    );
  }

  @override
  LikeCountProvider getProviderOverride(
    covariant LikeCountProvider provider,
  ) {
    return call(
      provider.data,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'likeCountProvider';
}

/// See also [likeCount].
class LikeCountProvider extends AutoDisposeStreamProvider<LikeInfo> {
  /// See also [likeCount].
  LikeCountProvider(
    Memory data,
  ) : this._internal(
          (ref) => likeCount(
            ref as LikeCountRef,
            data,
          ),
          from: likeCountProvider,
          name: r'likeCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likeCountHash,
          dependencies: LikeCountFamily._dependencies,
          allTransitiveDependencies: LikeCountFamily._allTransitiveDependencies,
          data: data,
        );

  LikeCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Memory data;

  @override
  Override overrideWith(
    Stream<LikeInfo> Function(LikeCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LikeCountProvider._internal(
        (ref) => create(ref as LikeCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LikeInfo> createElement() {
    return _LikeCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikeCountProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikeCountRef on AutoDisposeStreamProviderRef<LikeInfo> {
  /// The parameter `data` of this provider.
  Memory get data;
}

class _LikeCountProviderElement
    extends AutoDisposeStreamProviderElement<LikeInfo> with LikeCountRef {
  _LikeCountProviderElement(super.provider);

  @override
  Memory get data => (origin as LikeCountProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
