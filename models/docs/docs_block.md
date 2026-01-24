{% docs tanggal %}
Periode bulan dalam format tanggal **ISO 8601 (YYYY-MM-DD)** dan **selalu ditulis sebagai awal bulan** (contoh: `2024-01-01`).
{% enddocs %}

{% docs num_resign %}
Jumlah pegawai yang **resign** pada periode tersebut, ditulis sebagai **bilangan negatif**.
{% enddocs %}

{% docs num_new_hires %}
Jumlah pegawai **baru direkrut** pada periode tersebut, ditulis sebagai **bilangan positif**.
{% enddocs %}

{% docs net_change %}
Perubahan bersih jumlah pegawai pada periode tersebut, hasil kalkulasi antara **num_new_hires** dan **num_resign**.
{% enddocs %}

{% docs cum_change %}
Jumlah pegawai kumulatif pada bulan tersebut setelah memperhitungkan **num_resign** dan **num_new_hires**.
{% enddocs %}

{% docs prev_cum_change %}
Nilai **cum_change** pada bulan sebelumnya.
{% enddocs %}

{% docs bouncing_hires %}
Jumlah pegawai yang **resign pada bulan yang sama dengan bulan direkrut**.
{% enddocs %}

{% docs dim %}
Kategorisasi periode waktu (misalnya: Daily, Weekly, Monthly).
{% enddocs %}



{% docs retaining %}
Jumlah pegawai yang **bertahan**, hasil kalkulasi antara **num_resign** dan **bouncing_hires**.
{% enddocs %}

{% docs retention_rate %}
Tingkat retensi pegawai, hasil perhitungan antara **prev_cum_change** dan **retaining**.
{% enddocs %}




{% docs id %}
Unique identifier untuk konten yang telah dipublikasikan.
{% enddocs %}

{% docs created_time %}
Waktu publikasi konten dalam zona waktu **WIB**.
{% enddocs %}

{% docs user_id %}
Unique identifier untuk **username Instagram**.
{% enddocs %}

{% docs media_type %}
Tipe media yang diunggah di Instagram (misalnya: image, video, carousel).
{% enddocs %}

{% docs media_product_type %}
Kategorisasi **media_type** berdasarkan produk Instagram.
{% enddocs %}

{% docs unengagements %}
Jumlah interaksi negatif terhadap konten, meliputi **unlike, unsave, uncomment, dan unshare**.
{% enddocs %}
