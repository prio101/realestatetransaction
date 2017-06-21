require 'rails_helper'

RSpec.describe RealEstatesController, type: :controller do
  let(:real_estate) { FactoryGirl.create(:real_estate) }
  let(:real_estate_instance) { RealEstate }
  let(:valid_params) { FactoryGirl.attributes_for(:real_estate) }
  let(:invalid_params) { FactoryGirl.attributes_for(:real_estate,
                                                    price: 'Some') }
  let(:valid_update_attr) { FactoryGirl.attributes_for(:real_estate,
                                                       street: 'great wall') }
  let(:invalid_update_attr) { FactoryGirl.attributes_for(:real_estate,
                                                         street: ''
                                                         ) }
  describe '#index' do
    it 'returns 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template 'index'
    end

    it 'returns the collection of real_estate' do
      real_estate
      get :index
      expect(assigns(:real_estates)).to eq [real_estate]
    end
  end

  describe '#show' do
    it 'returns the 200 status code' do
      get :show, params: { id: real_estate.id }
      expect(response.status).to eq 200
    end

    it 'renders template show' do
      get :show, params: { id: real_estate.id }
      expect(response).to render_template 'show'
    end

    it 'returns the real_estate' do
      get :show, params: { id: real_estate.id }
      expect(assigns(:real_estate)).to eq real_estate
    end
  end

  describe '#new' do
    it 'returns the 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template 'new'
    end

    it 'returns a RealEstate class instance' do
      get :new
      expect(assigns(:real_estate)).to be_an_instance_of real_estate_instance
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'returns the status code 302' do
        post :create, params: { real_estate: valid_params }
        expect(response.status).to eq 302
      end

      it 'creates new record' do
        expect { post :create, params: { real_estate: valid_params } }
          .to change(RealEstate, :count).by(1)
      end

      it 'returns the success flash message' do
        post :create, params: { real_estate: valid_params }
        expect(flash[:success]).to eq 'Created'
      end

      it 'redirect to the real estate page' do
        post :create, params: { real_estate: valid_params }
        expect(response)
          .to redirect_to "/real_estates/#{assigns(:real_estate).id}"
      end
    end

    context 'with invalid params' do
      it 'returns the status code 302' do
        post :create, params: { real_estate: invalid_params }
        expect(response.status).to eq 200
      end

      it 'renders template new' do
        post :create, params: { real_estate: invalid_params }
        expect(response).to render_template 'new'
      end
    end
  end

  describe '#edit' do
    it 'returns the status code 200' do
      get :edit, params: { id: real_estate.id }
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      get :edit, params: { id: real_estate.id }
      expect(response).to render_template 'edit'
    end

    it 'matches the real estate page record' do
      get :edit, params: { id: real_estate.id }
      expect(assigns(:real_estate)).to eq real_estate
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'returns the status code 302' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: valid_update_attr }
        expect(response.status).to eq 302
      end

      it 'renders the real_estate template' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: valid_update_attr }
        expect(response)
          .to redirect_to "/real_estates/#{assigns(:real_estate).id}"
      end

      it 'returns the success flash message' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: valid_update_attr }
        expect(flash[:success]).to eq 'Data Updated'
      end

      it 'updates the attributes' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: valid_update_attr }
        real_estate.reload
        expect(real_estate.street).to eq 'great wall'
      end
    end

    context 'with invalid params' do
      it 'returns the status code 302' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: invalid_update_attr }
        expect(response.status).to eq 200
      end

      it 'renders edit template' do
        patch :update, params: { id: real_estate.id,
                                 real_estate: invalid_update_attr }
        expect(response).to render_template 'edit'
      end
    end
  end

  describe '#destroy' do
    it 'Success flash message' do
      delete :destroy, params: { id: real_estate }
      expect(flash[:success]).to eq 'Data Deleted'
    end

    it 'redirect to real estates path' do
      delete :destroy, params: { id: real_estate }
      expect(response).to redirect_to '/real_estates'
    end
  end
end
