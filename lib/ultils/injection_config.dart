import 'package:empresta_super_app/data/usecases/remote_health_insurance.dart';
import 'package:empresta_super_app/data/usecases/remote_institution.dart';
import 'package:empresta_super_app/data/usecases/remote_simulation.dart';
import 'package:empresta_super_app/presentation/presenters/home_page_store.dart';
import 'package:get_it/get_it.dart';

void configureInjection() {
  RemoteHealthInsurance remoteHealthInsurance = RemoteHealthInsurance();
  RemoteInstitution remoteInstitution = RemoteInstitution();
  RemoteSimulation remoteSimulation = RemoteSimulation();

  final getIt = GetIt.instance;

  getIt.registerLazySingleton<HomePageStore>(
    () => HomePageStore(
        remoteHealthInsurance, remoteInstitution, remoteSimulation),
  );
}
