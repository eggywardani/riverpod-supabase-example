import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memeories_app/core/utils.dart';
import 'package:memeories_app/memory/memory.dart';

class MemoryItemForm extends ConsumerStatefulWidget {
  const MemoryItemForm({super.key, this.data});
  final Memory? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemoryItemFormState();
}

class _MemoryItemFormState extends ConsumerState<MemoryItemForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _titleCtrl = TextEditingController();
  File? _file;
  @override
  void initState() {
    super.initState();
    _titleCtrl.text = widget.data?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  '${widget.data == null ? 'New' : 'Edit'} Memory',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _titleCtrl,
                  readOnly: _isSubmitting,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 20),
                if (widget.data != null)
                  SizedBox(
                    width: 200,
                    child: Image.network(
                      ref.read(imageUrlProvider(
                          userId: widget.data?.profileId ?? '',
                          filename: widget.data?.imageId ?? '')),
                    ),
                  ),
                const SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _isSubmitting
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate() == false) {
                                _autovalidateMode = AutovalidateMode.always;
                              } else if (widget.data != null) {
                                _updateMemory();
                              } else {
                                _addMemory();
                              }
                            },
                      child: const Text('Submit'),
                    )),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _isSubmitting ? null : _deleteMemory,
                      child: const Text('Delete'),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addMemory() async {
    if (_file == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref
          .read(memoryRepositoryProvider)
          .addMemory(title: _titleCtrl.text, file: _file!);
      _popView();
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  void _deleteMemory() async {
    if (widget.data == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(memoryRepositoryProvider).deleteMemory(data: widget.data!);
      _popView();
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  void _updateMemory() async {
    if (widget.data == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref
          .read(memoryRepositoryProvider)
          .updateMemory(title: _titleCtrl.text, id: widget.data?.id ?? 0);
      _popView();
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  _popView() {
    if (mounted) {
      context.pop();
    }
  }
}
