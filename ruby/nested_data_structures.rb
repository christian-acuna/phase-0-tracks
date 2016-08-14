# Goal: design and build a nested data structure
musuems = {
  louvre: {
    pretty_name: 'Louvre',
    city: 'Paris',
    country: 'France',
    gallery_space: 72_735,
    year_established: 1792,
    collections: [
      'Egyptian antiquities',
      'Near Eastern antiquities',
      'Greek, Etruscan, and Roman',
      'Islamic art',
      'Sculpture',
      'Decorative arts',
      'Painting',
      'Prints and drawings'
    ]
  },
  tokyo_national_musuem: {
    pretty_name: 'Tokyo National Museum',
    city: 'Tokyo',
    country: 'Japan',
    gallery_space: 38_000,
    year_established: 1872,
    exhibition_buildings: [
      'Honkan (Japanese Gallery)',
      'Tōyōkan (Asian Gallery)',
      'Hyōkeikan',
      'Heiseikan',
      'Sculpture',
      'Hōryū-ji Hōmotsukan (The Gallery of Hōryū-ji Treasures)'
    ]
  },
  art_institute_chicago: {
    pretty_name: 'Art Institute of Chicago',
    city: 'Chicago',
    country: 'United States',
    gallery_space: 26_000,
    year_established: 1870,
    collections: [
      'African Art and Indian Art of the Americas',
      'American Art',
      'Ancient and Byzantine',
      'Architecture and Design',
      'Asian Art',
      'European Decorative Arts',
      'European Painting and Sculpture',
      'Modern and Contemporary Art',
      'Photography',
      'Prints and Drawings',
      'Textiles'
    ]
  }
}
p musuems[:louvre]
p musuems[:louvre][:pretty_name]
p musuems[:louvre][:country]

p musuems[:tokyo_national_musuem]
p musuems[:tokyo_national_musuem][:year_established]
p musuems[:tokyo_national_musuem][:city]

p musuems[:art_institute_chicago]
p musuems[:art_institute_chicago][:collections]
p musuems[:art_institute_chicago][:collections].last
p musuems[:art_institute_chicago][:collections][4]
p musuems[:art_institute_chicago][:collections][0, 2]
p musuems[:art_institute_chicago][:collections].slice(2, 1)
p musuems[:art_institute_chicago][:collections][0..3]
