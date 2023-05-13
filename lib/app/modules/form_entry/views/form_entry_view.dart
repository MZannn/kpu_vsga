import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kpu/app/widgets/text_field.dart';

import '../controllers/form_entry_controller.dart';

class FormEntryView extends GetView<FormEntryController> {
  const FormEntryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Entry'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFieldKPU(
                controller: controller.nikController,
                labelText: "NIK",
                hintText: "Masukkan NIK",
              ),
              const SizedBox(height: 10),
              TextFieldKPU(
                controller: controller.namaController,
                labelText: "Nama",
                hintText: "Masukkan Nama",
              ),
              const SizedBox(height: 10),
              TextFieldKPU(
                controller: controller.noHpController,
                labelText: "No HP",
                hintText: "Masukkan No Hp",
              ),
              const SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                controller: controller.tglLahirController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Tanggal Lahir',
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tanggal dimulai tidak boleh kosong';
                  }
                  return null;
                },
                onTap: () {
                  controller.tglLahir(context);
                },
              ),
              Row(
                children: [
                  const Text("Jenis Kelamin"),
                  Obx(
                    () => Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: controller.selectedValue.value,
                          onChanged: (newValue) {
                            controller.updateSelectedValue(newValue!);
                          },
                        ),
                        const Text("Laki - Laki"),
                        Radio(
                          value: 2,
                          groupValue: controller.selectedValue.value,
                          onChanged: (newValue) {
                            controller.updateSelectedValue(newValue!);
                          },
                        ),
                        const Text("Perempuan"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFieldKPU(
                      controller: controller.alamatController,
                      labelText: "Alamat",
                      hintText: "Masukkan Alamat",
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.location();
                        },
                        child: const Text("Cek Lokasi")),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.onSave();
                },
                child: const Text("Submit"),
              )
            ],
          );
        },
      ),
    );
  }
}
