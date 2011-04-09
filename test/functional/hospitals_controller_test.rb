require 'test_helper'

class HospitalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Hospital.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Hospital.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Hospital.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to hospital_url(assigns(:hospital))
  end

  def test_edit
    get :edit, :id => Hospital.first
    assert_template 'edit'
  end

  def test_update_invalid
    Hospital.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Hospital.first
    assert_template 'edit'
  end

  def test_update_valid
    Hospital.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Hospital.first
    assert_redirected_to hospital_url(assigns(:hospital))
  end

  def test_destroy
    hospital = Hospital.first
    delete :destroy, :id => hospital
    assert_redirected_to hospitals_url
    assert !Hospital.exists?(hospital.id)
  end
end
