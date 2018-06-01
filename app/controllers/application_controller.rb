class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |e|
   respond_to do |format|
    # format이 html일 때 redirect_to 
    # 여기서 e.message 대신 '권한이 없습니다.' 라고 설정 가능!
    format.html { redirect_to root_path, notice: e.message } 
   end
  end

end
