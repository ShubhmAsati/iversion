class Utils{
  static String stripNonDigitCharactersAndCoutryCodeFromMobileNo(String mobileNo){
    mobileNo = mobileNo.trim().replaceAll(new RegExp(r'\D+'), "");
    if (mobileNo.length<10){
      return mobileNo;
    }
    return mobileNo.substring(mobileNo.length-10);
  }
}