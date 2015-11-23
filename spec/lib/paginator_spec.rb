describe Paginator do
  let(:developers) { build_list :developer, 2 }
  let(:kaminari_relation) { Kaminari.paginate_array(developers).page(Faker::Number.digit) }
  let(:params) { { page: nil, per_page: nil } }

  describe '.paginate_relation' do

    it 'maps the kaminari_relation' do
      expect(described_class).to receive(:map_from_relation_to_hash).with(
        kaminari_relation,
        described_class::DEFAULT_PAGE,
        kaminari_relation.default_per_page,
        kaminari_relation.total_count
      )

      described_class.paginate_relation(kaminari_relation, params)
    end

    context 'with params[:page]' do
      context 'when it is provided' do
        before do
          params[:page] = Faker::Number.digit.to_i
        end

        after do
          described_class.paginate_relation(kaminari_relation, params)
        end

        it 'maps the relation with params[:page]' do
          expect(described_class).to receive(:map_from_relation_to_hash).with(
            kaminari_relation,
            params[:page],
            kaminari_relation.default_per_page,
            kaminari_relation.total_count
          )
        end
      end

      context 'when it is not provided' do
        after do
          described_class.paginate_relation(kaminari_relation, params)
        end

        it 'maps the relation with ::DEFAULT_PAGE' do
          expect(described_class).to receive(:map_from_relation_to_hash).with(
            kaminari_relation,
            described_class::DEFAULT_PAGE,
            kaminari_relation.default_per_page,
            kaminari_relation.total_count
          )
        end
      end
    end

    context 'with params[:per_page]' do
      context 'when it is provided' do
        before do
          params[:per_page] = Faker::Number.digit.to_i
        end

        after do
          described_class.paginate_relation(kaminari_relation, params)
        end

        it 'maps the relation with params[:per_page]' do
          expect(described_class).to receive(:map_from_relation_to_hash).with(
            kaminari_relation,
            described_class::DEFAULT_PAGE,
            params[:per_page],
            kaminari_relation.total_count
          )
        end
      end

      context 'when it is not provided' do
        after do
          described_class.paginate_relation(kaminari_relation, params)
        end

        it 'maps the relation with kaminari_relation\'s default_per_page' do
          expect(described_class).to receive(:map_from_relation_to_hash).with(
            kaminari_relation,
            described_class::DEFAULT_PAGE,
            kaminari_relation.default_per_page,
            kaminari_relation.total_count
          )
        end
      end
    end
  end

  describe '.map_from_relation_to_hash' do
    let(:items) { build_list :project, 2 }
    let(:page) { Faker::Number.digit }
    let(:per_page) { Faker::Number.digit }
    let(:total_items) { Faker::Number.digit }
    let(:method_response) { described_class.map_from_relation_to_hash(items, page, per_page, total_items) }

    it 'returns a hash with items' do
      expect(method_response).to include :items
      expect(method_response[:items]).to eq items
    end

    it 'returns a hash with the provided page' do
      expect(method_response[:meta]).to include :page
      expect(method_response[:meta][:page]).to eq page
    end

    it 'returns a hash with the provided per_page' do
      expect(method_response[:meta]).to include :per_page
      expect(method_response[:meta][:per_page]).to eq per_page
    end

    it 'returns a hash with the provided total_items' do
      expect(method_response[:meta]).to include :total_items
      expect(method_response[:meta][:total_items]).to eq total_items
    end
  end

end
