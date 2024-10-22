import 'package:flutter/material.dart';

class vistaReservation extends StatelessWidget {
  const vistaReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 335,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Cochera de Juan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF3C4E67),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'assets/img/cochera1.jpg',
                width: 283,
                height: 212,
              ),
              const SizedBox(height: 10),
              const Text(
                'Descripción',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3C4E67),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 319,
                height: 131,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'Estacionamiento confiable',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF3C4E67),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Precio \n199.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3C4E67),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Calificación -> \n4.2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3C4E67),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Lógica del botón aquí
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6CD391),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Reservar ahora',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
