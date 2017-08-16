# Configuration parameters for fetchtool
class fetchtool::settings (
  $user        = hiera('fetchool::settings::user', 'mark'),
  $group       = hiera('fetchool::settings::group', 'wheel'),
  $fetch_tool  = hiera('fetchtool::settings::fetchtool', 'fetchtool::internal::wget'),
){
}
